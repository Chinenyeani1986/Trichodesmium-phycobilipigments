# -*- coding: utf-8 -*-
"""
Created on Mon Dec 19 16:05:08 2016

@author: mon126
"""

# Pyton library needed
#from mpl_toolkits.basemap import Basemap
import numpy as np
from matplotlib.font_manager import FontProperties
#from mpl_toolkits.basemap import Basemap
import matplotlib.pyplot as plt
import matplotlib.dates as mdates
from pylab import *
import netCDF4
import os,sys
import datetime as dt
import time
import pandas as pd
#from skill_stat import bias
#from skill_stat import rmse
#from skill_stat import meanabs
#import seawater as sw
from scipy import stats
tep=[]
teph=[]
plt.close("all")


site_name=[  "IMOS_GBRCCH_02",
  "IMOS_GBRHIS_02",
  "IMOS_GBRLSH_02",
  "IMOS_GBRMYR_02",
  "IMOS_GBRNSI_02",
  "IMOS_GBROTE_02",
  "IMOS_GBRPPS_02",
  "IMOS_GBRYON_02",
  "LTM_Barren_02",
  "LTM_Cape_Trib_02",
  "LTM_Daydream_02",
  "LTM_Dbl_Is_02",
  "LTM_Fairlead_02",
  "LTM_Green_02",
  "LTM_Humpy_02",
  "LTM_Pelican_02",
  "LTM_Pt_Doug_02",
  "LTM_Snapper_02",
  "LTM_Yorkeys_02",
  "MMP_BUR13_02",
  "MMP_Dbl_Cone_02",
  "MMP_Dunk_02",
  "MMP_Fitz_Rf_02",
  "MMP_Geoff_B_02",
  "MMP_High_02",
  "MMP_Pandora_02",
  "MMP_Pelorus_02",
  "MMP_Pine_02",
  "MMP_RM1_02",
  "MMP_Russell_02",
  "MMP_TUL1_02",
  "MMP_WHI7_02",
  "Elusive_Rf_02",
  "Hardy_Rf_02",
  "Lucinda_Jt_02",
  "Mantis_Rf_02",
  "Wistari_02",
  "IMOS_GBRYON_10",
  "IMOS_GBRYON_20",
  "IMOS_GBRNSI_20",
  "IMOS_GBRNSI_50",
  "MMP_Pine_20",      
  "MMP_Pelorus_28",
  "MMP_Russel_20",   
  "MMP_High_20",     
  "MMP_Fitz_Rf_15",  
  "LTM_Yorkeys_8",   
  "LTM_Green_36",    
  "LTM_Dbl_I_18",  
  "LTM_Pt_Doug_15"]

#  
#IMOS_GBRYON_10.ts   7  38
#IMOS_GBRYON_20.ts   7  39
#IMOS_GBRNSI_20.ts  4   40
#IMOS_GBRNSI_50.ts 4  41
#MMP_Pine_20      27  42
#MMP_Pelorus_28   26  43
#MMP_Russel_20   29   44
#MMP_High_20     24  45
#MMP_Fitz_Rf_15  22  46
#LTM_Yorkeys_8   18  47 
#LTM_Green_36    13  48
#LTM_Dbl_I_18  11   49
#LTM_Pt_Doug_15  16  50

obs_level=(2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,10,20,20,50,20,28,20,20,15,8,36,18,15)
shift1=   (2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,7,7,4,4,27,26,29,24,22,18,13,11,16)
shift2=   (2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,38,39,40,41,42,43,44,45,46,47,48,49,50)

nobs=len(obs_level)
###################################################################################################################
###################################################################################################################

def get_eReefs_data(filenam_eReefsi,a1l0,dz_mi,zgrid,zlev): 
    
#filenam_eReefs[0],a1l,dz_m,zgrid0,zlev0    
#   filenam_eReefs is the obs netcdf file
#   a1l0 is the number of time point in the file

#   dz_mi is  the level of waterin each cell

#   zgrid  is the layer face

#   zlev is the layer thickness    
    ##################################
    tep_gbr4=[]
    teph_gbr4=[]
#    nobs=37
    ## then get the model  gbr4  1 files for the whole time period
    file_modelgbr4 = netCDF4.Dataset(filenam_eReefsi)
    #print('fewfwe')
    #cc=filenam_eReefsi
    #file_modelgbr4_2d=cc[:-11]+'_2d'+cc[-11:]
    time_gbr4=file_modelgbr4.variables['time'][:]
    #print(file_modelgbr4_2d)

    #file_modelgbr4_2dn = netCDF4.Dataset(file_modelgbr4_2d)

#pre alocate some array
    NO3_gbr4=np.empty([len(time_gbr4),47,nobs])
    Chla_sum_gbr4=np.empty([len(time_gbr4),47,nobs])
    Secchi_gbr4=np.empty([len(time_gbr4),nobs])
    DIP_gbr4=np.empty([len(time_gbr4),47,nobs])
    NH4_gbr4=np.empty([len(time_gbr4),47,nobs])
    Fluorescence=np.empty([len(time_gbr4),47,nobs])
    OC3M=np.empty([len(time_gbr4),nobs])
    KD490M=np.empty([len(time_gbr4),nobs])
    temp=np.empty([len(time_gbr4),47,nobs])
    salt=np.empty([len(time_gbr4),47,nobs])
    PAR_z=np.empty([len(time_gbr4),47,nobs])
    
    NO3_gbr4[:,:,0:37]=file_modelgbr4.variables['NO3'][:,:,0:37]
    Chla_sum_gbr4[:,:,0:37] = file_modelgbr4.variables['Chl_a_sum'][:,:,0:37]
    Secchi_gbr4[:,0:37]=file_modelgbr4.variables['Secchi'][:,0:37]
    DIP_gbr4[:,:,0:37]=file_modelgbr4.variables['DIP'][:,:,0:37]
    NH4_gbr4[:,:,0:37] = file_modelgbr4.variables['NH4'][:,:,0:37]
    Fluorescence[:,:,0:37] = file_modelgbr4.variables['Fluorescence'][:,:,0:37] 
    OC3M[:,0:37] = file_modelgbr4.variables['OC3M'][:,0:37] 
    KD490M[:,0:37] = file_modelgbr4.variables['KD490M'][:,0:37] 
    temp[:,:,0:37] = file_modelgbr4.variables['temp'][:,:,0:37] 
    salt[:,:,0:37] = file_modelgbr4.variables['salt'][:,:,0:37] 
    PAR_z[:,:,0:37] = file_modelgbr4.variables['PAR_z'][:,:,0:37]     

    for i in range(nobs-37-1):  #(13)    
        NO3_gbr4[:,:,shift2[i+37]]=NO3_gbr4[:,:,shift1[i+37]]
        Chla_sum_gbr4[:,:,shift2[i+37]]= Chla_sum_gbr4[:,:,shift1[i+37]]
        Secchi_gbr4[:,shift2[i+37]]=Secchi_gbr4[:,shift1[i+37]]
        DIP_gbr4[:,:,shift2[i+37]]=DIP_gbr4[:,:,shift1[i+37]]
        NH4_gbr4[:,:,shift2[i+37]]=NH4_gbr4[:,:,shift1[i+37]]
        Fluorescence[:,:,shift2[i+37]]=Fluorescence[:,:,shift1[i+37]]
        OC3M[:,shift2[i+37]]=OC3M[:,shift1[i+37]]
        KD490M[:,shift2[i+37]]= KD490M[:,shift1[i+37]]
        temp[:,:,shift2[i+37]]=temp[:,:,shift1[i+37]]
        salt[:,:,shift2[i+37]]=salt[:,:,shift1[i+37]]
        PAR_z[:,:,shift2[i+37]]=PAR_z[:,:,shift1[i+37]]


    time_gbr4=file_modelgbr4.variables['time'][:]
    

    
    tt=time_gbr4    
    dt4 = datetime.datetime(1990,1,1)
    ts4 = time.mktime(dt4.timetuple())
    time_gbr4=time_gbr4*86400+ts4  ## t in second since 00
    no3_gbr4_0=np.empty([len(time_gbr4),nobs])
    Chla_sum_gbr4_0=np.empty([len(time_gbr4),nobs])
    Secchi_gbr4_0=np.empty([len(time_gbr4),nobs])
    DIP_gbr4_0=np.empty([len(time_gbr4),nobs])
    NH4_gbr4_0=np.empty([len(time_gbr4),nobs])
    Fluorescence_0=np.empty([len(time_gbr4),nobs])
    OC3M_0=np.empty([len(time_gbr4),nobs])
    KD490M_0=np.empty([len(time_gbr4),nobs])
    temp_0=np.empty([len(time_gbr4),nobs])
    salt_0=np.empty([len(time_gbr4),nobs])
    PAR_z_0=np.empty([len(time_gbr4),nobs])
    indexz_0 =np.empty([len(time_gbr4),nobs])
    
    for i in range(len(time_gbr4)):
            tep_gbr4.append(datetime.datetime.fromtimestamp(time_gbr4[i]).strftime('%Y-%m-%d'))
            teph_gbr4.append(datetime.datetime.fromtimestamp(time_gbr4[i]).strftime('%Y-%m-%d %H:%M:%S'))
            for ob in range(nobs):
                lo=zlev-dz_mi[i,ob,:]  # layer tickness minus level in each layer 
                #loi=find(zlev-(dz_mi[i,ob])!=0)  #this is the index of where the water is
                loi=[h for h, e in enumerate(lo) if e != 0][0]
                #try:
                    #loi=loi[0]
                #except:
                    #loi=loi
                   
                if not(loi):
                    ids=44
                else:                        
                    lo[loi]+zgrid[loi]    # this is the depth  where the water is in zgrid space 
                    lo[loi]+zgrid[loi]-obs_level[ob]  # this is the depth we are looking for still in zgird space
                    cv=lo[loi]+zgrid[loi]-obs_level[ob]
                    ids=[]
                    ids=(np.abs(zgrid-cv)).argmin()
                    if (np.isnan(NO3_gbr4[i,ids,ob])):
                        ids=ids+1
    
                    if (np.isnan(NO3_gbr4[i,ids,ob])):
                        ids=ids+1



                Chla_sum_gbr4_0[i,ob]=Chla_sum_gbr4[i,ids,ob]
                no3_gbr4_0[i,ob]=NO3_gbr4[i,ids,ob]
                Secchi_gbr4_0[i,ob]=Secchi_gbr4[i,ob]
                DIP_gbr4_0[i,ob]=DIP_gbr4[i,ids,ob]
                NH4_gbr4_0[i,ob]=NH4_gbr4[i,ids,ob]
                Fluorescence_0[i,ob]=Fluorescence[i,ids,ob]
                OC3M_0[i,ob]=OC3M[i,ob]
                KD490M_0[i,ob]=KD490M[i,ob]
                temp_0[i,ob]=temp[i,ids,ob]
                salt_0[i,ob]=salt[i,ids,ob]
                PAR_z_0[i,ob]=PAR_z[i,ids,ob]
                indexz_0[i,ob]=ids
                
                
                
                
                            
    x_gbr4 = file_modelgbr4.variables['x'][:] 
    x_gbr4=x_gbr4[:]
    
    y_gbr4 = file_modelgbr4.variables['y'][:] 
    y_gbr4=y_gbr4[:]
                
         
    # now chosse whic level to pikc to get the water surface
            
            
    return teph_gbr4,tep_gbr4,time_gbr4,no3_gbr4_0,x_gbr4,y_gbr4,tt,Secchi_gbr4_0,DIP_gbr4_0,NH4_gbr4_0,Fluorescence_0,OC3M_0,KD490M_0,temp_0,salt_0,PAR_z_0,Chla_sum_gbr4_0,indexz_0
###################################################################################################################
###################################################################################################################

## main programm
###################################################################################################################
###################################################################################################################

## get the vertical grid specifications
file_modelgbr4 = netCDF4.Dataset('/export/home/a-e/cani/eReefs/inputs/gbr4_bgc_H2p0_BGC3p1_7639p5_init.nc')

botz=((file_modelgbr4.variables['botz'][:]))
zgrid0=file_modelgbr4.variables['z_grid'][:]
z_centre=file_modelgbr4.variables['z_centre'][:] 
file_modelgbr4.close()
zlev0=[]   

# compute the tickness of each layers 
for i in range(47):
         zlev0.append(-zgrid0[i]+zgrid0[i+1])
zlev0[-1]=0
####



m_netcdf_main=open('/export/home/a-e/cani/eReefs/photoacclimate/gbr4-obs/netcdf_obs_3p2.mnc','r')
nlist=m_netcdf_main.readlines()
ntl=len(nlist)
m_netcdf_main.close
filenam_eReefs=nlist[0].split()
#ntl=2
#compute the number od time points ntime
aa=[]
aaa=0
for i in range(ntl):
    filenam_eReefs=nlist[i].split()
    #print(filenam_eReefs)
    file_modelgbr4 = netCDF4.Dataset(filenam_eReefs[-1])   
    aaa=len(file_modelgbr4.variables['time'][:])+aaa
    aa.append(len(file_modelgbr4.variables['time'][:]))
nbi=aaa

nbij=nobs
## preallocate array
teph_gbr4_m=[]
tep_gbr4_m=[]
time_gbr4_m=[]

Chla_sum_gbr4_m=np.empty([nbi,nbij])
NO3_gbr4_m=np.empty([nbi,nbij])
Secchi_gbr4_m=np.empty([nbi,nbij])
indexz_m=np.empty([nbi,nbij])

DIP_gbr4_m=np.empty([nbi,nbij])
NH4_gbr4_m=np.empty([nbi,nbij])
OC3M_m=np.empty([nbi,nbij])
KD490M_m=np.empty([nbi,nbij])
temp_m=np.empty([nbi,nbij])
salt_m=np.empty([nbi,nbij])
PAR_z_m=np.empty([nbi,nbij])
Fluorescence_m=np.empty([nbi,nbij])
tt_m=np.empty([nbi])

x_gbr4_m=np.empty([nbi,nbij])
y_gbr4_m=np.empty([nbi,nbij])

def cat_array(arrr_m,arrr):
    st=np.append([arrr_m],[arrr],axis=1)
    arrr_m=np.squeeze(st)
    return arrr_m


def get_level_and_dz(eta,zlev):
    ## compute waetater level 
    Hwc=sum(zlev[0:-2])+eta
    deltad=[]
    for i in range(47):
        deltad.append(Hwc-sum(zlev[0:i])) 
        deltadd=np.array(deltad)
        deltadd[deltadd<0]=999
    water_I=argmin(np.abs(deltadd))  # index of the current water level
    if (water_I==46):
        cw=0
    else:
        cw=zlev[water_I]
    
    if (eta>0):
        water_i_dz=deltad[water_I]-(cw)
        zlev_real=zlev[:]
        zlev_real[water_I]=zlev[water_I]+water_i_dz
    else:
        water_i_dz=zlev[water_I]-deltad[water_I]
        zlev_real=zlev[:]   
        zlev_real[water_I]=zlev[water_I]-water_i_dz

    for j in range(water_I+1,len(zlev_real)):
        zlev_real[j]=0.0
    return(water_I,zlev_real)




for i in range(ntl):
# 
    filenam_eReefs=nlist[i].split()
    #print(filenam_eReefs)
    file_modelgbr4 = netCDF4.Dataset(filenam_eReefs[0])  
    #cc=filenam_eReefs[0]
    #file_modelgbr4_2d=cc[:-11]+'_2d'+cc[-11:]
    time_gbr4=file_modelgbr4.variables['time'][:]
    #file_modelgbr4_2dn = netCDF4.Dataset(file_modelgbr4_2d)
     
    
    
    
    
    etaa=((file_modelgbr4.variables['eta'][:]))
    eta=etaa[:,0:37]
    [a1l,a2l]=eta.shape
    dz_m=np.empty([a1l,nbij,47])
    ## inlfate
    etaM=np.empty([(a1l),nobs])
    etaM[:,0:37]=eta
    for ii in range(nobs-37-1):  #(13)    
        etaM[:,shift2[ii+37]]=eta[:,shift1[ii+37]]

    
    for a1 in range(a1l):  ##loop over time in days
#        print(a1)
        for a2 in range(nbij):        #loop over  longitude   #number of obs              
            [aa,bb]=get_level_and_dz(etaM[a1,a2],zlev0)
            dz_m[a1,a2,:]=bb

    
    
    
#    
    tep_gbr4,teph_gbr4,time_gbr4,NO3_gbr4,x_gbr4,y_gbr4,tt,Secchi_gbr4,DIP_gbr4,NH4_gbr4,Fluorescence,OC3M,KD490M,temp,salt,PAR_z,Chla_sum_gbr4,indexz= get_eReefs_data(filenam_eReefs[0],a1l,dz_m,zgrid0,zlev0)
#   filenam_eReefs is the obs netcdf file
#   a1l is the number of time point in the file
#   dz_m is  the level of waterin each cell
#   zgrid0  is the layer face
#   zlev0 is the layer thickness    
    if (i==0):
        NO3_gbr4_m=NO3_gbr4
        Secchi_gbr4_m=Secchi_gbr4
        DIP_gbr4_m=DIP_gbr4
        NH4_gbr4_m=NH4_gbr4
        Fluorescence_m=Fluorescence
        OC3M_m=OC3M
        KD490M_m=KD490M
        temp_m=temp
        salt_m=salt
        PAR_z_m=PAR_z
        tt_m=tt
        Chla_sum_gbr4_m=Chla_sum_gbr4
        indexz_m=indexz
    else:
        NO3_gbr4_m=cat_array(NO3_gbr4_m,NO3_gbr4)
        Secchi_gbr4_m=cat_array(Secchi_gbr4_m,Secchi_gbr4)
        DIP_gbr4_m=cat_array(DIP_gbr4_m,DIP_gbr4)
        NH4_gbr4_m=cat_array(NH4_gbr4_m,NH4_gbr4)
        Fluorescence_m=cat_array(Fluorescence_m,Fluorescence)
        OC3M_m=cat_array(OC3M_m,OC3M)
        KD490M_m=cat_array(KD490M_m,KD490M)
        temp_m=cat_array(temp_m,temp)
        salt_m=cat_array(salt_m,salt)
        PAR_z_m=cat_array(PAR_z_m,PAR_z)
        tt_m=cat_array(tt_m,tt)
        Chla_sum_gbr4_m=cat_array(Chla_sum_gbr4_m,Chla_sum_gbr4)
        indexz_m=cat_array(indexz_m,indexz)
    teph_gbr4_m.append(teph_gbr4)
    tep_gbr4_m.append(tep_gbr4)
    time_gbr4_m.append(time_gbr4)


ert=np.empty([nbi,6])
  ## loop over time
for j in range((nobs)):  #lopp over sites
    fff=open('/export/home/a-e/cani/eReefs/photoacclimate/gbr4-obs/ts_3p2/'+site_name[j]+'.ts','w')
    fff.write('## COLUMNS 13\n')
    fff.write('##\n')
    fff.write('## COLUMN1.name Time\n')
    fff.write('## COLUMN1.long_name Time\n')
    fff.write('## COLUMN1.units days since 1990-01-01 00:00:00 +10\n')
    fff.write('## COLUMN1.missing_value -999\n')
    fff.write('## COLUMN1.fill_value 0.0\n')
    fff.write('##\n')
    fff.write('## COLUMN2.name NO3\n')
    fff.write('## COLUMN2.long_name nitrate\n')
    fff.write('## COLUMN2.units mg m-3\n')
    fff.write('## COLUMN2.missing_value -999\n')
    fff.write('## COLUMN2.fill_value 0\n')
    fff.write('##\n')    
    fff.write('## COLUMN3.name Secchi\n')
    fff.write('## COLUMN3.long_name secchi depth\n')
    fff.write('## COLUMN3.units m\n')
    fff.write('## COLUMN3.missing_value -999\n')
    fff.write('## COLUMN3.fill_value 0\n')    
    fff.write('##\n')    
    fff.write('## COLUMN4.name DIP\n')
    fff.write('## COLUMN4.long_name DIP\n')
    fff.write('## COLUMN4.units mg m-3\n')
    fff.write('## COLUMN4.missing_value -999\n')
    fff.write('## COLUMN4.fill_value 0\n')    
    fff.write('##\n')    
    fff.write('## COLUMN5.name NH4\n')
    fff.write('## COLUMN5.long_name NH4/n')
    fff.write('## COLUMN5.units mg m-3\n')
    fff.write('## COLUMN5.missing_value -999\n')
    fff.write('## COLUMN5.fill_value 0\n')    
    fff.write('##\n')    
    fff.write('## COLUMN6.name fluorescence\n')
    fff.write('## COLUMN6.long_name fluorescence\n')
    fff.write('## COLUMN6.units mg m-3\n')
    fff.write('## COLUMN6.missing_value -999\n')
    fff.write('## COLUMN6.fill_value 0\n')    
    fff.write('##\n')    
    fff.write('## COLUMN7.name OC3M\n')
    fff.write('## COLUMN7.long_name OC3M\n')
    fff.write('## COLUMN7.units mg m-3\n')
    fff.write('## COLUMN7.missing_value -999\n')
    fff.write('## COLUMN7.fill_value 0\n')    
    fff.write('##\n')    
    fff.write('## COLUMN8.name Kd490m\n')
    fff.write('## COLUMN8.long_name Kd490m\n')
    fff.write('## COLUMN8.units mg m-3\n')
    fff.write('## COLUMN8.missing_value -999\n')
    fff.write('## COLUMN8.fill_value 0\n')    
    fff.write('##\n')
    fff.write('## COLUMN9.name temp\n')
    fff.write('## COLUMN9.long_name nitrate\n')
    fff.write('## COLUMN9.units \n')
    fff.write('## COLUMN9.missing_value -999\n')
    fff.write('## COLUMN9.fill_value 0\n')    
    fff.write('##\n')
    fff.write('## COLUMN10.name salt\n')
    fff.write('## COLUMN10.long_name\n')
    fff.write('## COLUMN10.units mg m-3\n')
    fff.write('## COLUMN10.missing_value -999\n')
    fff.write('## COLUMN10.fill_value 0\n')    
    fff.write('##\n')    
    fff.write('## COLUMN11.name PAR_z\n')
    fff.write('## COLUMN11.long_name PAR_z\n')
    fff.write('## COLUMN11.units mg m-3\n')
    fff.write('## COLUMN11.missing_value -999\n')
    fff.write('## COLUMN11.fill_value 0\n')    
    fff.write('##\n')    
    fff.write('## COLUMN12.name Chl_a_sum\n')
    fff.write('## COLUMN12.long_name Chlorophyl-a\n')
    fff.write('## COLUMN12.units mg m-3\n')
    fff.write('## COLUMN12.missing_value -999\n')
    fff.write('## COLUMN12.fill_value 0\n')       
    fff.write('##\n')
    fff.write('## COLUMN13.name index\n')
    fff.write('## COLUMN13.long_name depth index\n')
    fff.write('## COLUMN13.units nil \n')
    fff.write('## COLUMN13.missing_value -999\n')
    fff.write('## COLUMN13.fill_value 0\n')       
    fff.write('##\n')    
    for i in range(nbi):
        fff.write(str(tt_m[i])+' '+str(NO3_gbr4_m[i,j])+'  ' +str(Secchi_gbr4_m[i,j])+'  '+str(DIP_gbr4_m[i,j])+'  '+str(NH4_gbr4_m[i,j])+'  '+str(Fluorescence_m[i,j])+'  '+str(OC3M_m[i,j])+'  '+str(KD490M_m[i,j])+'  '+str(temp_m[i,j])+'  '+str(salt_m[i,j])+'  '+str(PAR_z_m[i,j])+'  '+str(Chla_sum_gbr4_m[i,j])+'  '+str(indexz_m[i,j])+'  '+ '\n')
        