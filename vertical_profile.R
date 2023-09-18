setwd("/export/home/a-e/cani/eReefs/Photoacclimate/tran_outputs1")
#library(dplyr)
library(ggplot2)
library('ereefs')
library(ncdf4)
library('dplyr')

var_names=c('Nfix', 'Tricho_Chl', 'Tricho_N', 'Tricho_I', 'Tricho_NR')
#This script extracts and plots the vertical profile variables.

profile_data = get_ereefs_profile(var_names= var_names,
			 location_latlon=c(-17.75,146.6), #(-17.75, 146.4), (-20, 150.5), (-16.1118386,145.4838227), (-23.39189, 150.88852),  
			 start_date = c(2010, 12, 10),
			 end_date = c(2010, 12, 20),
                         input_file = "out_simple1.nc",
			 input_grid = "out_std.nc",
			 eta_stem = NA,
			 squeeze = TRUE,
			 override_positive=FALSE)

saveRDS(profile_data, file = "profile.rds")

earth.dist <- function (long1, lat1, long2, lat2)
{
  rad <- pi/180
  a1 <- lat1 * rad
  a2 <- long1 * rad
  b1 <- lat2 * rad
  b2 <- long2 * rad
  dlon <- b2 - a2
  dlat <- b1 - a1
  a <- (sin(dlat/2))^2 + cos(a1) * cos(b1) * (sin(dlon/2))^2
  c <- 2 * atan2(sqrt(a), sqrt(1 - a))
  R <- 6378.145
  d <- R * c
  return(d)
}


plot_ereefs_zvt <- function(slice, var_name='Chl_a_sum', scale_col=c("ivory", "hotpink"), scale_lim=NA, var_units="") {
	numprofiles <- dim(slice$profiles)[3]
	layers <- length(slice$z_grid) - 1
	zmin <- array(slice$z_grid[1:layers], c(layers, numprofiles))
	zmax <- array(slice$z_grid[2:(layers+1)], c(layers, numprofiles))
	for (i in 1:numprofiles) {
		zmin[zmin[,i]<slice$botz,i] <- slice$botz
		zmin[zmin[,i]>slice$eta[i],i] <- slice$eta[i]
		zmax[zmax[,i]<slice$botz,i] <- slice$botz
		zmax[zmax[,i]>slice$eta[i],i] <- slice$eta[i]
	}
	d <- slice$dates
	dmin <- c(d[1]-(d[2]-d[1])/2, d[1:(length(d)-1)])
	dmin <- t(array(dmin, c(numprofiles, layers)))
	dmax <- c(d[2:length(d)], d[length(d)-1] + (d[length(d)] - d[length(d)-1])/2)
	dmax <- t(array(dmax, c(numprofiles, layers)))

	ind <- which(!is.na(slice$profiles[, var_name, ]))
	profiles <- slice$profiles[, var_name, ]
	#profiles <- slice$profiles[, 'Tricho_N', ] + slice$profiles[, 'Tricho_NR', ]
	if (length(scale_lim)==1) {
		scale_lim[1] <- min(c(profiles[ind]))
		scale_lim[2] <- max(c(profiles[ind]))
	}

	mydata <- data.frame(xmin=as.Date(dmin[ind], origin='1990-01-01'), xmax=as.Date(dmax[ind], origin='1990-01-01'), 
			     ymin=zmin[ind], ymax=zmax[ind], 
			     z=profiles[ind])
	p <- ggplot2::ggplot(data=mydata, aes(xmin=xmin,xmax=xmax,ymin=ymin,ymax=ymax, fill=z)) + 
		ggplot2::geom_rect() +
		ggplot2::scale_x_date() +
		ggplot2::ylab('Metres above mean sea level') 
        p = p + ggplot2::scale_fill_distiller(palette = 'Spectral',
                             na.value="transparent", 
                             guide="colourbar", 
                             limits=scale_lim, 
                             name=var_units, 
                             oob=scales::squish) + theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                                                                        axis.text=element_text(size=16), axis.title=element_text(size=18),
        								legend.text=element_text(size=16),legend.title=element_text(size=18))

		#ggplot2::scale_fill_gradient(name=var_name, low=scale_col[1], high=scale_col[2], limits=scale_lim, oob=scales::squish)
	plot(p)
	return(p)
}

p1 = plot_ereefs_zvt(profile_data, var_name='Tricho_N', scale_lim=NA, var_units= expression(mg~N~m^-3)) 
ggsave(p1, file= "tricho_nr_prof.png" )

p2 = plot_ereefs_zvt(profile_data, var_name='Tricho_Chl', scale_lim=NA, var_units= expression(mg~Chl~m^-3)) 
ggsave(p2, file= "tricho_chl_prof.png" )

p3 = plot_ereefs_zvt(profile_data, var_name='Tricho_PUB', scale_lim=NA, var_units= expression(mg~C~m^-3)) 
ggsave(p3, file= "tricho_pub_prof.png" )

p4 = plot_ereefs_zvt(profile_data, var_name='Tricho_PEB', scale_lim=NA, var_units= expression(mg~N~m^-3~s^-1)) 
ggsave(p4, file= "tricho_peb.png" )






