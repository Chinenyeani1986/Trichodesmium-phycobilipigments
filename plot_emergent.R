setwd("C:/Users/cani/OneDrive - Australian Institute of Marine Science/Desktop/Photoacclimate")
# Plots emergent properties
library('ncdf4')
library(ggplot2)
library(plyr)
library('ggpubr')

#Created by barbara Robson
#Modified by Chinenye Ani


# Fits courtesy of Lee de Mora:
microHirata2011 <- function(chl) {
    #chl <- 10^chl # this is needed as we are using log scales
    100./(0.9117 + exp(-2.733 * log10(chl) + 0.4003))
}
microFitHirata2011 <- function(chl) {
# from    fit <-nls(PhyL_Chl_perc~100./(a + exp(b * log10(Chl) + d)), start=list(a=0.9117, b=-2.733, d = 0.4003))
    #chl <- 10^chl # this is needed as we are using log scales
    a <- 32.153
    b <- -3.982
    d <- 5.259
    100./(a + exp(b * log10(chl) + d))
}
#fit <-nls(PhyL_Chl~100./(a + exp(b * log10(Chl) + d)))
picoHirata2011  <- function(chl) {
    #chl <- 10^chl
    100.*(1./(-1.*(0.1529 + exp(1.0306 * log10(chl) -1.5576))) - 1.8587*log10(chl)+2.9954)
}
nanoHirata2011  <- function(chl) {
    100. - microHirata2011(chl) - picoHirata2011(chl)
}
piconanoHirata2011 <- function(chl) {
   100. - microHirata2011(chl) #+2
}

# To obtain parameters for the fits that follow: fit=nls(PhyS_Chl~Cm*(1-exp(-S*Chl)))
piconanoFitBrewin2010 <- function(chl) {
    #chl <- 10^chl
    (0.8595 * (1 - exp(-1.0195 * chl)))/chl*100 
}
microFitBrewin2010 <- function(chl) {
    100. - piconanoBrewin2010(chl) 
}

piconanoBrewin2010 <- function(chl) {
    #chl <- 10^chl
    (1.057 * (1 - exp(-0.851 * chl)))/chl*100 
}
microBrewin2010 <- function(chl) {
    100. - piconanoBrewin2010(chl) 
}

my_data1 = read.csv("gbr4_surface.csv")
my_data = read.csv("bgc3p2_gbr4_surface.csv")
my_data = mutate(my_data, Chl = Tricho_Chl + PhyS_Chl + PhyL_Chl, percent_small = PhyS_Chl/Chl * 100, percent_large = PhyL_Chl/Chl * 100 + Tricho_Chl/Chl * 100, Zoo = ZooS_N + ZooL_N)
my_data1 = mutate(my_data1, Chl = Tricho_Chl + PhyS_Chl + PhyL_Chl, percent_small = PhyS_Chl/Chl * 100, percent_large = PhyL_Chl/Chl * 100 + Tricho_Chl/Chl * 100, Zoo = ZooS_N + ZooL_N)
my_data1 <- my_data1[complete.cases(my_data1),]
my_data <- my_data[complete.cases(my_data),]


p1 <- ggplot(my_data1, aes(x = Chl, y = percent_large)) + 
      geom_point(color="blue", alpha=0.1) +
      scale_x_log10(lim=c(1e-2, 3)) +
      xlab(expression(paste("total chlorophyll (mg m"^"-3",")"))) +
      ylab('% large phytoplankton') +
      theme(panel.background = element_blank(), panel.grid.major = element_line(colour = "#E6E6E3"), 
        panel.grid.minor = element_line(colour = '#E6E6E3'), axis.line = element_line(colour = "black"), 
        axis.text=element_text(size=18), axis.title=element_text(size=18),
        legend.text=element_text(size=18),legend.title=element_text(size=18),
        panel.border = element_rect(colour='black', fill=NA)) + 
      stat_function(fun = microHirata2011, aes(colour = "Hirata 2011") , size = 1) +
      #stat_function(fun = microFitHirata2011, colour="gold") +
      stat_function(fun = microFitBrewin2010, aes(colour="Brewin 2010"), size = 1) +
      scale_color_manual("",  breaks = c("Hirata 2011", "Brewin 2010"), values = c("red", "black"))
      
p2 <- ggplot(my_data1, aes(x = Chl, y = percent_small)) + 
      geom_point(color="green", alpha=0.1) +
      scale_x_log10(lim=c(1e-2, 3)) +
      xlab(expression(paste("total chlorophyll (mg m"^"-3",")"))) +
      ylab('% small phytoplankton') +
      theme(panel.background = element_blank(), panel.grid.major = element_line(colour = "#E6E6E3"), 
        panel.grid.minor = element_line(colour = '#E6E6E3'), axis.line = element_line(colour = "black"), 
        axis.text=element_text(size=18), axis.title=element_text(size=18),
        legend.text=element_text(size=18),legend.title=element_text(size=18),
        panel.border = element_rect(colour='black', fill=NA)) + 
      stat_function(fun = piconanoHirata2011, aes(colour = "Hirata 2011"), size = 1) +
      stat_function(fun = piconanoFitBrewin2010, aes(colour="Brewin 2010"), size = 1) +
      scale_color_manual("", breaks = c("Hirata 2011", "Brewin 2010"), values = c("red", "black"))


p3 <- ggplot() +
      geom_point(my_data1, mapping = aes(x = Chl, y = Zoo, colour="Modified GBR4-BGC"), alpha=0.1) + 
      geom_point(my_data, mapping = aes(x = Chl, y = Zoo, colour="GBR4-BGC"), alpha=0.1) + 
      geom_smooth(my_data1, mapping = aes(x = Chl, y = Zoo), colour = '#0072BD') +
      geom_smooth(my_data, mapping = aes(x = Chl, y = Zoo), colour = '#D95319') +
      #stat_smooth(color='black')  +
      theme(panel.background = element_blank(), panel.grid.major = element_line(colour = "#E6E6E3"), 
        panel.grid.minor = element_line(colour = '#E6E6E3'), axis.line = element_line(colour = "black"), 
        axis.text=element_text(size=18), axis.title=element_text(size=18),
        legend.text=element_text(size=18),legend.title=element_text(size=18),
        panel.border = element_rect(colour='black', fill=NA)) + 
      ylim(0, 12.5) + xlim(0,4) +
      xlab(expression(paste("total chlorophyll (mg m"^"-3",")"))) +
      ylab(expression(paste("zooplankton (mg N m"^"-3",")"))) + 
      scale_color_manual("", breaks = c("Modified GBR4-BGC", "GBR4-BGC"), values = c("#0072BD", "#D95319"))



plt_data = ggarrange(p1, p2, ncol = 1, nrow = 2)
ggsave('phy_photo.png',plt_data, width=7)

ggsave('zoo_photo.png',p3)



