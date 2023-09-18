setwd("C:/Users/cani/OneDrive - Australian Institute of Marine Science/Desktop/Photoacclimate")
library(ggplot2)
library(sf)
library("patchwork")
library(rgdal)

#This script plots spatially-resolved mean Trichodesmium variables

#map <- readOGR('Great_Barrier_Reef_Marine_Park_Boundary.shp')  #read gbrmp boundary shapefile
#map.df <- fortify(map)   # convert data to dataframe
#map.df <- subset(map.df, select=c("long", "lat"))


phyls_spring = readRDS("phyLS_spring.rds")
phyls_summer = readRDS("phyLS_summer.rds")
tricho_summer = readRDS("tricho_summer.rds")
tricho_spring = readRDS("tricho_spring.rds")
din_spring = readRDS("din_spring.rds")
din_summer = readRDS("din_summer.rds")
dip_spring = readRDS("dip_spring.rds")
dip_summer = readRDS("dip_summer.rds")


towns <- data.frame(latitude = c(-15.47027987, -19.26639219, -21.15345122, -26.18916037),
                    longitude = c(145.2498605, 146.805701, 149.1655418, 152.6581893),
                    town = c('Cooktown', 'Townsville', 'Mackay', 'Gympie'))


box_bounds = c(min(phyls_spring$x), max(phyls_spring$x), min(phyls_spring$y), max(phyls_spring$y))
#scale_lim <- c(min(phyls_summer$value, na.rm=TRUE), max(phyls_summer$value, na.rm=TRUE))
p1 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = phyls_spring) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(phyls_summer$value, na.rm=TRUE), max(phyls_summer$value, na.rm=TRUE)), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle("Modified BGC3p2") + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(),
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

p2 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = phyls_summer) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(phyls_summer$value, na.rm=TRUE), max(phyls_summer$value, na.rm=TRUE)), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle('Modified BGC3p2') + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(),
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

p3 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = tricho_spring) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(tricho_spring$value, na.rm=TRUE), max(tricho_spring$value, na.rm=TRUE)), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle("Modified BGC3p2") + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(),
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

p4 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = tricho_summer) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(tricho_spring$value, na.rm=TRUE), max(tricho_spring$value, na.rm=TRUE)), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle("Modified BGC3p2") + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(),
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")



#p = p3 + p1      #plot_layout(guides = "collect")

#ggsave(p, file= "mean_org_spring.png" )

#p_1 = p4 + p2
#ggsave(p_1, file= "mean_org_summer.png" )


p5 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = din_spring) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(din_spring$value, na.rm=TRUE), 25), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle('Modified BGC3p2') + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(), 
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

p6 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = dip_spring) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(dip_spring$value, na.rm=TRUE), 25), 
                       name=expression(mg~P~m^-3), 
                       oob=scales::squish) + ggtitle('Modified BGC3p2') + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(), 
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

p7 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = din_summer) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(din_summer$value, na.rm=TRUE), 25), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle('Modified BGC3p2') + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(), 
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

p8 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = dip_summer) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(dip_summer$value, na.rm=TRUE), 25), 
                       name=expression(mg~P~m^-3), 
                       oob=scales::squish) + ggtitle('Modified BGC3p2') + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(), 
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")


#P = p4 + p5    #plot_layout(guides = "collect")
#P

#ggsave(P, file= "mean_nut_spring.png" )


phyls_spring_old = readRDS("bgc3p2_phyLS_spring.rds")
phyls_summer_old = readRDS("bgc3p2_phyLS_summer.rds")
tricho_summer_old = readRDS("bgc3p2_tricho_summer.rds")
tricho_spring_old = readRDS("bgc3p2_tricho_spring.rds")
din_spring_old = readRDS("bgc3p2_din_spring.rds")
din_summer_old = readRDS("bgc3p2_din_summer.rds")
dip_spring_old = readRDS("bgc3p2_dip_spring.rds")
dip_summer_old = readRDS("bgc3p2_dip_summer.rds")

p_1 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = phyls_spring_old) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(phyls_summer$value, na.rm=TRUE), max(phyls_summer$value, na.rm=TRUE)), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle("BGC3p2") + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(),
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

p_2 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = phyls_summer_old) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(phyls_summer$value, na.rm=TRUE), max(phyls_summer$value, na.rm=TRUE)), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle('BGC3p2') + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(),
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

p_3 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = tricho_spring_old) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(tricho_spring_old$value, na.rm=TRUE), max(tricho_spring$value, na.rm=TRUE)), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle("BGC3p2") + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(),
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

p_4 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = tricho_summer_old) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(tricho_spring_old$value, na.rm=TRUE), max(tricho_spring$value, na.rm=TRUE)), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle("BGC3p2") + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(),
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")


p_5 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = din_spring_old) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(din_spring_old$value, na.rm=TRUE), 25), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle('BGC3p2') + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(), 
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

p_6 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = dip_spring_old) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(dip_spring_old$value, na.rm=TRUE), 25), 
                       name=expression(mg~P~m^-3), 
                       oob=scales::squish) + ggtitle('BGC3p2') + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(), 
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

p_7 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = din_summer_old) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(din_summer_old$value, na.rm=TRUE), 25), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle('BGC3p2') + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(), 
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

p_8 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = dip_summer_old) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(dip_summer_old$value, na.rm=TRUE), 25), 
                       name=expression(mg~P~m^-3), 
                       oob=scales::squish) + ggtitle('BGC3p2') + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(), 
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

P1 = p1 + p_1 
P1
ggsave(P1, file= "mean_phy_spring.png" )

P2 = p2 + p_2    
P2
ggsave(P2, file= "mean_phy_summer.png" )

P3 = p3 + p_3    
P3
ggsave(P3, file= "mean_tricho_spring.png" )

P4 = p4 + p_4    
P4
ggsave(P4, file= "mean_tricho_summer.png" )

P5 = p5 + p_5    
P5
ggsave(P5, file= "mean_din_spring.png" )

P6 = p6 + p_6    
P6
ggsave(P6, file= "mean_dip_spring.png" )

P7 = p7 + p_7    
P7
ggsave(P7, file= "mean_din_summer.png" )

P8 = p8 + p_8    
P8
ggsave(P8, file= "mean_dip_summer.png" )


phyls_spring_diff = phyls_spring
phyls_summer_diff = phyls_summer
tricho_summer_diff = tricho_summer
tricho_spring_diff = tricho_spring

phyls_spring_diff$value = phyls_spring$value - phyls_spring_old$value
phyls_summer_diff$value = phyls_summer$value - phyls_summer_old$value
tricho_summer_diff$value = tricho_summer$value - tricho_summer_old$value
tricho_spring_diff$value = tricho_spring$value - tricho_spring_old$value

pp_1 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = phyls_spring_diff) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(phyls_summer_diff$value, na.rm=TRUE), max(phyls_summer_diff$value, na.rm=TRUE)), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle("") + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(),
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

pp_2 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = phyls_summer_diff) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(phyls_summer_diff$value, na.rm=TRUE), max(phyls_summer_diff$value, na.rm=TRUE)), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle('') + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(),
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

pp_3 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = tricho_spring_diff) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(tricho_spring_diff$value, na.rm=TRUE), max(tricho_spring_diff$value, na.rm=TRUE)), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle("") + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(),
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")

pp_4 <- ggplot() + geom_polygon(ggplot2::aes(x=x, y=y, fill=value, group=id), data = tricho_summer_diff) + 
  geom_text(data=towns, ggplot2::aes(x=longitude, y=latitude, label=town, hjust="right"), size = 3.0, nudge_x=-0.1) +
  geom_point(data=towns, ggplot2::aes(x=longitude, y=latitude), color = "black") +
  scale_fill_distiller(palette = 'Spectral',
                       na.value="transparent", 
                       guide="colourbar", 
                       limits=c(min(tricho_spring_diff$value, na.rm=TRUE), max(tricho_spring_diff$value, na.rm=TRUE)), 
                       name=expression(mg~N~m^-3), 
                       oob=scales::squish) + ggtitle("") + 
  xlab('') + ylab('') + scale_x_continuous(breaks = c(142, 146, 150, 154, 158), limits = c(142, 157)) +
  scale_y_continuous(limits = c(-30, -7)) + coord_map(xlim = box_bounds[1:2], ylim=box_bounds[3:4]) +
  theme_bw() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
                     panel.border = element_blank(), axis.line.x = element_blank(), axis.line.y = element_blank(),
                     axis.ticks.x = element_blank(), axis.ticks.y = element_blank(), 
                     axis.text.x = element_blank(), axis.text.y = element_blank(), legend.position= "bottom")


P_1 = p_1 + pp_1 
ggsave(P_1, file= "mean_phy_spring_diff.png" )

P_2 = p_2 + pp_2    
ggsave(P_2, file= "mean_phy_summer_diff.png" )

P_3 = p_3 + pp_3    
ggsave(P_3, file= "mean_tricho_spring_diff.png" )

P_4 = p_4 + pp_4    
ggsave(P_4, file= "mean_tricho_summer_diff.png" )

