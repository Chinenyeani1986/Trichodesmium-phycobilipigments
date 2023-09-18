setwd("/export/home/a-e/cani/eReefs/Photoacclimate/tran_outputs")
library('ereefs')
library('ncdf4')
library(ggplot2)

input_file <- substitute_filename('out_simple.nc')
nc <- nc_open(input_file)
botz <- ncvar_get(nc, 'botz')
latitude <- ncvar_get(nc, 'latitude')
longitude <- ncvar_get(nc, 'longitude')
nc_close(nc)

times_avail <- as.Date(as.Date('2010-12-02'):as.Date('2012-11-30'), origin='1970-01-01')

# dimension is 600x180. 
max_x <- dim(botz)[2] 
max_y <- dim(botz)[1] 

n <- 15000 # target number of samples
n2 <- n * 1.5 # sample slightly more than the target so we can remove duplicates and dry cells

sample_points <- data.frame(x = sample(1:max_x, n2, replace = TRUE), 
                            y = sample(1:max_y, n2, replace = TRUE), 
                            d = sort(sample(times_avail, n2, replace = TRUE)))
# remove duplicates
sample_points <- sample_points[!duplicated(sample_points),]
# remove dry cells
depth = c(botz)[sample_points$y + (sample_points$x - 1) * dim(botz)[1]]
sample_points <- sample_points[!is.na(depth), ][1:n,]
depth <- depth[!is.na(depth)][1:n]

latitude = c(latitude)[sample_points$y + (sample_points$x - 1) * dim(latitude)[1]]
latitude = latitude[1:n]
longitude = c(longitude)[sample_points$y + (sample_points$x - 1) * dim(longitude)[1]]
longitude = longitude[1:n]

ereefs_data <- data.frame(date = sample_points$d[1:n],
                          depth = depth,
                          latitude = latitude,
                          longitude = longitude,
                          Nfix = NA*depth,
                          Tricho_Chl = NA*depth,
                          PhyS_N = NA*depth,
                          PhyL_N = NA*depth,
                          Tricho_N = NA*depth,
                          PhyS_Chl = NA*depth,
                          PhyL_Chl = NA*depth,
                          ZooS_N = NA*depth,
                          ZooL_N = NA*depth,
                          Chl_a_sum = NA*depth)

var_names <-c('Nfix', 'Tricho_Chl', 'PhyS_N', 'PhyL_N', 'Tricho_N', 'PhyS_Chl', 'PhyL_Chl', 'ZooS_N', 'ZooL_N', 'Chl_a_sum')

arch <- 1:n
pb <- txtProgressBar(min = 0, max = n, style = 3)
for (i in arch) {
  ereefs_data[i, 5:dim(ereefs_data)[2]] <-  get_ereefs_ts(var_names, 
                                                          location_latlon = c(ereefs_data$latitude[i], ereefs_data$longitude[i]),
                                                          layer = 'surface',
                                                          start_date = ereefs_data$date[i], 
                                                          end_date = ereefs_data$date[i], 
                                                          input_file = input_file,
                                                          verbosity = 0)[,-1]
  setTxtProgressBar(pb,i)
}
close(pb)


write.csv(ereefs_data, "photo_gbr4_surface.csv", row.names = F, quote = F) # write output to a csv file
