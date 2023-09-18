%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% nrs nutrient good to go NO3
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
set(0,'defaultTextInterpreter','latex');
%addpath('/home/mon126/matlab_perso')
%addpath('/home/mon126/plum')


eii=00 % define the number of ensemble 
expi='nil'

t_in=datenum('12/01/2010')-datenum('1990-01-01 00:00:00')   %% 
t_out=datenum('11/30/2012')-datenum('1990-01-01 00:00:00') %% 

var_name='NO3   '
var_names='NO3'
var_unit='(mg N m$^{-3})$'
pathd='obs_gbr_jan2020\NRS_2020nuts\'

tracer_name = ('NO3');  
tracer_obs =  [2]; % column 2 is aims MMP sensor mooring
tracer_mod =  [7]; % column 7 is chla coloumn in the mode
tracer_modc =  [2]; % column 13 is chla coloumn in the model
tracer_modc2 =  [2]; % column 13 is chla column in the model

hlimn=10
sites = {'Yongala_0','Yongala_10','Yongala_20', 'North_Stradbroke_0', 'North_Stradbroke_20','North_Stradbroke_50'};% in order of latitude north to south
sites0 =sites
sites1={'IMOS_GBRYON_02','IMOS_GBRYON_02','IMOS_GBRYON_20','IMOS_GBRNSI_02','IMOS_GBRNSI_20','IMOS_GBRNSI_50'}
pathn='NRS_NO3_2020'
SITES = [
'Yong-0m     ',
'Yong-10m    ',
'Yong-20m    ',
'NorthS-0m   ',
'NorthS-20m  ',
'NorthS-50m  '];
%p0_reanalysis_polished_control_only_3p1_3p2
p0_reanalysis_polished_control_only_old_site_old_new_model

% nrs nutrient good to go  DIP
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
set(0,'defaultTextInterpreter','latex');
%addpath('/home/mon126/matlab_perso')
%addpath('/home/mg/matlab/plum')


eii=00 % define the number of ensemble 
expi='nil'

t_in=datenum('12/01/2010')-datenum('1990-01-01 00:00:00')   %% 
t_out=datenum('11/30/2012')-datenum('1990-01-01 00:00:00') %% 

var_name='DIP   '
var_names='DIP'
var_unit='(mg P m$^{-3}$)'
pathd='obs_gbr_jan2020\NRS_2020nuts\'

tracer_name = ('DIP');  
tracer_obs =  [4]; % column 2 is aims MMP sensor mooring
tracer_mod =  [9]; % column 7 is chla coloumn in the mode
tracer_modc =  [4]; % column 13 is chla coloumn in the mode
tracer_modc2 =  [4]; % column 13 is chla column in the model

hlimn=10
sites = {'Yongala_0','Yongala_10','Yongala_20', 'North_Stradbroke_0', 'North_Stradbroke_20','North_Stradbroke_50'};% in order of latitude north to south
sites0 =sites
sites1={'IMOS_GBRYON_02','IMOS_GBRYON_02','IMOS_GBRYON_20','IMOS_GBRNSI_02','IMOS_GBRNSI_20','IMOS_GBRNSI_50'}
pathn='NRS_NO3_2020'
SITES = [
'Yong-0m     ',
'Yong-10m    ',
'Yong-20m    ',
'NorthS-0m   ',
'NorthS-20m  ',
'NorthS-50m  '];
%p0_reanalysis_polished_control_only_3p1_3p2
p0_reanalysis_polished_control_only_old_site_old_new_model

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% nrs chla pigment  ok
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
set(0,'defaultTextInterpreter','latex');
%addpath('/home/mon126/matlab_perso')
%addpath('/home/mg/matlab/plum')


eii=00 % define the number of ensemble 
expi='nil'

t_in=datenum('12/01/2010')-datenum('1990-01-01 00:00:00')   %% 
t_out=datenum('11/30/2012')-datenum('1990-01-01 00:00:00') %% 

var_name='Chla  '
var_names='Chla'
var_unit='(mg Chl m$^{-3}$)'
pathd='obs_gbr_jan2020\IMOS_PIG_2020\'

tracer_name = ('Chl_a_sum');  
tracer_obs =  [2]; % column 2 is aims MMP sensor mooring
tracer_mod =  [7]; % column 7 is chla coloumn in the mode
tracer_modc =  [12]; % column 13 is chla coloumn in the mode
tracer_modc2 =  [12]; % column 13 is chla column in the model

hlimn=3
sites = {'Yongala_10','Yongala_20', 'North_Stradbroke_50', 'North_Stradbroke_20'};% in order of latitude north to south
sites0 =sites
sites1={'IMOS_GBRYON_02','IMOS_GBRYON_20','IMOS_GBRNSI_02','IMOS_GBRNSI_20'}
pathn='NRS_chla_2020'
SITES = [
'Yong-0m     ',
'Yong-20m    ',
'NorthS-0m   ',
'NorthS-20m  '];
%p0_reanalysis_polished_control_only_3p1_3p2
p0_reanalysis_polished_control_only_old_site_old_new_model

%p0_reanalysis_polished_new_sites_2exp_control
save NRS_chla_2020.mat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ltmp  chla extraction ok
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
set(0,'defaultTextInterpreter','latex');
%addpath('/home/mon126/matlab_perso')
%addpath('/home/mg/matlab/plum')


eii=0 % define the number of ensemble 
expi='nil'

t_in=datenum('12/01/2010')-datenum('1990-01-01 00:00:00')   %% 
t_out=datenum('11/30/2012')-datenum('1990-01-01 00:00:00') %% 


tracer_name = ('Chl_a_sum');  
tracer_obs =  [5]; % column 2 in the s MMP sensor mooring
tracer_mod =  [13]; % column 13 is chla column in the model
tracer_modc =  [12]; % column 12 is chla column in the model
tracer_modc2 =  [12]; % column 12 is chla column in the model

var_name='Chla  '
var_names='Chla_exctraction'
var_unit='(mg Chl m$^{-3})$'
hlimn=3
pathd='obs_gbr_jan2020\AIMS_LTM2020\LTMfrom1_3_2016\'

%sites = {'Pine329_20m','Pine329_0m','Pelorus686_28m','Pelorus686_0m','Russell695_20m','HighI697_20m','HighI697_0m','FitzCoral852_15m','FairleadBuoy518_0m','Yorkeys519_8m','Yorkeys519_0m','Green830_36m','Green830_0m','DoubleI520_18m','DoubleI520_0m','PortD_0m','PortD_15m'};% in order of latitude north to south
%sites0 = {'Pine_20m','Pine_0m','Pelorus_28m','Pelorus_0m','Russell_20m','HighI_20m','HighI_0m','FitzCoral_15m','FairleadBuoy_0m','Yorkeys_8m','Yorkeys_0m','Green_36m','Green_0','DoubleI_18m','DoubleI_0m','PortD_0m','PortD_15m'};% in order of latitude north to south

%sites = {'Pine329_20m','Pine329_0m','Pelorus686_28m','Pelorus686_0m','Russell695_20m','HighI697_20m','HighI697_0m','FitzCoral852_15m','FairleadBuoy518_0m','Yorkeys519_8m','Yorkeys519_0m','DoubleI520_18m','DoubleI520_0m','PortD_0m','PortD_15m'};% in order of latitude north to south
%sites0 = {'Pine_20m','Pine_0m','Pelorus_28m','Pelorus_0m','Russell_20m','HighI_20m','HighI_0m','FitzCoral_15m','FairleadBuoy_0m','Yorkeys_8m','Yorkeys_0m','DoubleI_18m','DoubleI_0m','PortD_0m','PortD_15m'};% in order of latitude north to south
%sites1={ 'MMP_Pine_20','MMP_Pine_20','MMP_Pelorus_28','MMP_Pelorus_02','MMP_Russel_20','MMP_High_20','MMP_High_02','MMP_Fitz_Rf_15','LTM_Fairlead_02','LTM_Yorkeys_8','LTM_Yorkeys_02','LTM_Dbl_I_18','LTM_Dbl_Is_02','LTM_Pt_Doug_02','LTM_Pt_Doug_15'}
pathn='AIMS_ltmp_chla_extraction2020'

%% need AE04_0m.ts,AE04_23m.ts,AR01_0m.ts,AR02b_0m.ts,AR02b_10m.ts,AR03_0m.ts,AR03_12m.ts,BUR13_16.ts,...
%%  BUR13_6.ts,BUR5_0m.ts,BUR7_0m.ts,BUR7_12m.ts,BUR9_0m.ts,CapeTrib356_10m.ts
%  DoubleCone_23m.ts,DoubleCone334_10m.ts,DunkNth_0m.ts,DunkNth_7m.ts,
%  DunkSEast_0m.ts,DunkSEast_20m.ts,ER01_0m.ts,ER02b_0m.ts,ER03_0m.ts,ER03_15m.ts,
%GeoffreyBay336_5m.ts,Green830_40m.ts,KR01_0m.ts,
%,,KR02_0m.ts,NR04_0m.ts,NR04_17m.ts,NR05_0m..ts,Pandora_5m.ts
% PRBB_0m.ts,PRBB_19m.ts,PRN01_0m.ts,PRN02_0m.ts,PRN03_0m.ts,
%PRN03_17m,PRN04_0m.ts,
%PRN04_24m.ts,PRN05_0m.ts,PRN05_24m.ts,=RM10_7m.ts,RM11_0m.ts
%RM4_0m.tRM6_0m.ts,s,RM7_0m.ts,RM7_23m.ts,RM9_0m.ts,Russell695_10m.ts,
%SR03_0m.ts,SR03_8m.ts,SR04_0m.ts,SR04_12m.ts,SR05_0m.ts,SR05_15m.ts,
%TUL10_0m.ts,TUL10_6m.ts,TUL11_0m.ts,TUL2_0m.ts,TUL2_23m.ts,
%TUL4_0m.ts,
%TUL6_0m.ts,TUL6_7m.ts,TUL7_0m.ts,TUL8_0m.ts,TUL8_8m.ts,TUL9_0m.ts,
%WHI5_0m.ts,WHI5_14m.ts,WHI5_6m.ts,WHI6_0m.ts,WHI6_6m.ts,WHI7_16m.ts,WHI7_6m.ts

%obs 
sites={'CapeTrib_0m','PortD_0m','PortD_15m','DoubleI520_0m','DoubleI520_18m','Green830_0m',...
    'Yorkeys519_0m','Yorkeys519_8m','FairleadBuoy518_0m','FitzCoral852_0m','FitzCoral852_15m',...
    'HighI697_0m','Russell695_20m','Dunk859_5m','Pelorus686_0m','Pelorus686_28m',...
    'Pandora_0m','GeoffreyBay_0m','Pine329_0m','Pine329_20m'}

%3.0
%sites0={'DoubleCone_5m','DoubleI_0m','DoubleI_18m','Dunk_5m',...
%    'FairleadBuoy_0m','FitzCoral_0m','GeoffreyBay_5m',...
%'Green_0m','HighI_0m','Pandora_5m','Pelorus_0m','Pelorus_28m',...
%'Pine_0m','Pine_20m','PortD_0m','PortD_15m','RM10','Russell_20m',...
%'WHI7','Yongala_0','Yongala_26','Yorkeys_0m','Yorkeys_0m'}

%3.2
sites1={'LTM_Cape_Trib_02','LTM_Pt_Doug_02','LTM_Pt_Doug_15','LTM_Dbl_Is_02',...
    'LTM_Dbl_I_18','LTM_Green_02','LTM_Yorkeys_02','LTM_Yorkeys_8',...
    'LTM_Fairlead_02','MMP_Fitz_Rf_02','MMP_Fitz_Rf_15','MMP_High_02',...
    'MMP_Russel_20','MMP_Dunk_02','MMP_Pelorus_02','MMP_Pelorus_28',...
    'MMP_Pandora_02','MMP_Geoff_B_02','MMP_Pine_02','MMP_Pine_20'}
SITES = [
'CapeT-0m  ',
'PortD-0m  ',
'PortD-15m ',
'DblI-0m   ',
'DblI-18m  ',
'Green-0m  ',
'York-0m   ',
'York-8m   ',
'Fairl-0m  ',
'Fitz-0m   ',
'Fitz-15m  ',
'High-0m   ',
'Russ-20m  ',
'Dunk-5m   ',
'Pelo-0m   ',
'Pelo-28m  ',
'Pand-0m   ',
'Geoff-0m  ',
'Pine-0m   ',
'Pine-20m  ']


%p0_reanalysis_polished_control_only_3p1_3p2
p0_reanalysis_polished_control_only_old_site_old_new_model
%p0_reanalysis_polished_new_sites_2exp_control
save lmtp_pigment_extraction.mat

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ltmp  NO3 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
set(0,'defaultTextInterpreter','latex');
%addpath('/home/mon126/matlab_perso')
%addpath('/home/mg/matlab/plum')


eii=0 % define the number of ensemble 
expi='nil'

t_in=datenum('12/01/2010')-datenum('1990-01-01 00:00:00')   %% 
t_out=datenum('11/30/2012')-datenum('1990-01-01 00:00:00') %% 


tracer_name = ('NO_3');  
tracer_obs =  [3]; % column 2 in the s MMP sensor mooring
tracer_mod =  [13]; % column 13 is chla column in the model
tracer_modc =  [2]; % column 13 is chla column in the model
tracer_modc2 =  [2]; % column 13 is chla column in the model

var_name='NO3   '
var_names='NO3'
var_unit='(mg N m$^{-3})$'
hlimn=10
pathd='obs_gbr_jan2020\AIMS_LTM2020\LTMfrom1_3_2016\'

%sites = {'Pine329_20m','Pine329_0m','Pelorus686_28m','Pelorus686_0m','Russell695_20m','HighI697_20m','HighI697_0m','FitzCoral852_15m','FairleadBuoy518_0m','Yorkeys519_8m','Yorkeys519_0m','Green830_36m','Green830_0m','DoubleI520_18m','DoubleI520_0m','PortD_0m','PortD_15m'};% in order of latitude north to south
%sites0 = {'Pine_20m','Pine_0m','Pelorus_28m','Pelorus_0m','Russell_20m','HighI_20m','HighI_0m','FitzCoral_15m','FairleadBuoy_0m','Yorkeys_8m','Yorkeys_0m','Green_36m','Green_0','DoubleI_18m','DoubleI_0m','PortD_0m','PortD_15m'};% in order of latitude north to south

%sites = {'Pine329_20m','Pine329_0m','Pelorus686_28m','Pelorus686_0m','Russell695_20m','HighI697_20m','HighI697_0m','FitzCoral852_15m','FairleadBuoy518_0m','Yorkeys519_8m','Yorkeys519_0m','DoubleI520_18m','DoubleI520_0m','PortD_0m','PortD_15m'};% in order of latitude north to south
%sites0 = {'Pine_20m','Pine_0m','Pelorus_28m','Pelorus_0m','Russell_20m','HighI_20m','HighI_0m','FitzCoral_15m','FairleadBuoy_0m','Yorkeys_8m','Yorkeys_0m','DoubleI_18m','DoubleI_0m','PortD_0m','PortD_15m'};% in order of latitude north to south
%sites1={ 'MMP_Pine_20','MMP_Pine_20','MMP_Pelorus_28','MMP_Pelorus_02','MMP_Russel_20','MMP_High_20','MMP_High_02','MMP_Fitz_Rf_15','LTM_Fairlead_02','LTM_Yorkeys_8','LTM_Yorkeys_02','LTM_Dbl_I_18','LTM_Dbl_Is_02','LTM_Pt_Doug_02','LTM_Pt_Doug_15'}
pathn='AIMS_ltmp_nut_2020'

%% need AE04_0m.ts,AE04_23m.ts,AR01_0m.ts,AR02b_0m.ts,AR02b_10m.ts,AR03_0m.ts,AR03_12m.ts,BUR13_16.ts,...
%%  BUR13_6.ts,BUR5_0m.ts,BUR7_0m.ts,BUR7_12m.ts,BUR9_0m.ts,CapeTrib356_10m.ts
%  DoubleCone_23m.ts,DoubleCone334_10m.ts,DunkNth_0m.ts,DunkNth_7m.ts,
%  DunkSEast_0m.ts,DunkSEast_20m.ts,ER01_0m.ts,ER02b_0m.ts,ER03_0m.ts,ER03_15m.ts,
%GeoffreyBay336_5m.ts,Green830_40m.ts,KR01_0m.ts,
%,,KR02_0m.ts,NR04_0m.ts,NR04_17m.ts,NR05_0m..ts,Pandora_5m.ts
% PRBB_0m.ts,PRBB_19m.ts,PRN01_0m.ts,PRN02_0m.ts,PRN03_0m.ts,
%PRN03_17m,PRN04_0m.ts,
%PRN04_24m.ts,PRN05_0m.ts,PRN05_24m.ts,=RM10_7m.ts,RM11_0m.ts
%RM4_0m.tRM6_0m.ts,s,RM7_0m.ts,RM7_23m.ts,RM9_0m.ts,Russell695_10m.ts,
%SR03_0m.ts,SR03_8m.ts,SR04_0m.ts,SR04_12m.ts,SR05_0m.ts,SR05_15m.ts,
%TUL10_0m.ts,TUL10_6m.ts,TUL11_0m.ts,TUL2_0m.ts,TUL2_23m.ts,
%TUL4_0m.ts,
%TUL6_0m.ts,TUL6_7m.ts,TUL7_0m.ts,TUL8_0m.ts,TUL8_8m.ts,TUL9_0m.ts,
%WHI5_0m.ts,WHI5_14m.ts,WHI5_6m.ts,WHI6_0m.ts,WHI6_6m.ts,WHI7_16m.ts,WHI7_6m.ts

%obs 
sites={'CapeTrib_0m','PortD_0m','PortD_15m','DoubleI520_0m','DoubleI520_18m','Green830_0m',...
    'Yorkeys519_0m','Yorkeys519_8m','FairleadBuoy518_0m','FitzCoral852_0m','FitzCoral852_15m',...
    'HighI697_0m','Russell695_20m','Dunk859_5m','Pelorus686_0m','Pelorus686_28m',...
    'Pandora_0m','GeoffreyBay_0m','Pine329_0m','Pine329_20m'}

%3.0
%sites0={'DoubleCone_5m','DoubleI_0m','DoubleI_18m','Dunk_5m',...
%    'FairleadBuoy_0m','FitzCoral_0m','GeoffreyBay_5m',...
%'Green_0m','HighI_0m','Pandora_5m','Pelorus_0m','Pelorus_28m',...
%'Pine_0m','Pine_20m','PortD_0m','PortD_15m','RM10','Russell_20m',...
%'WHI7','Yongala_0','Yongala_26','Yorkeys_0m','Yorkeys_0m'}

%3.2
sites1={'LTM_Cape_Trib_02','LTM_Pt_Doug_02','LTM_Pt_Doug_15','LTM_Dbl_Is_02',...
    'LTM_Dbl_I_18','LTM_Green_02','LTM_Yorkeys_02','LTM_Yorkeys_8',...
    'LTM_Fairlead_02','MMP_Fitz_Rf_02','MMP_Fitz_Rf_15','MMP_High_02',...
    'MMP_Russel_20','MMP_Dunk_02','MMP_Pelorus_02','MMP_Pelorus_28',...
    'MMP_Pandora_02','MMP_Geoff_B_02','MMP_Pine_02','MMP_Pine_20'}
SITES = [
'CapeT-0m  ',
'PortD-0m  ',
'PortD-15m ',
'DblI-0m   ',
'DblI-18m  ',
'Green-0m  ',
'York-0m   ',
'York-8m   ',
'Fairl-0m  ',
'Fitz-0m   ',
'Fitz-15m  ',
'High-0m   ',
'Russ-20m  ',
'Dunk-5m   ',
'Pelo-0m   ',
'Pelo-28m  ',
'Pand-0m   ',
'Geoff-0m  ',
'Pine-0m   ',
'Pine-20m  ']



%p0_reanalysis_polished_control_only_3p1_3p2
p0_reanalysis_polished_control_only_old_site_old_new_model
%p0_reanalysis_polished_new_sites_2exp_control
save lmtp_NO3.mat

%%  this is new mmp fluoe form aims in 2020
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
close all
set(0,'defaultTextInterpreter','latex');
%addpath('/home/mon126/matlab_perso')
%addpath('/home/mg/matlab/plum')


eii=0 % define the number of ensemble 
expi='nil'

%t_in=datenum('03/01/2016')-datenum('1990-01-01 00:00:00')   %% 
%t_out=datenum('09/30/2019')-datenum('1990-01-01 00:00:00') %% 


t_in=datenum('12/01/2010')-datenum('1990-01-01 00:00:00')   %% 
t_out=datenum('11/30/2012')-datenum('1990-01-01 00:00:00') %% 

tracer_name = ('Chla ');  
tracer_obs =  [2]; % column 2 in the s MMP sensor mooring
tracer_mod =  [13]; % column 13 is chla column in the model
tracer_modc =  [12]; % column 13 is chla column in the model
tracer_modc2 =  [12]; % column 13 is chla column in the model

var_name='Chla  '
var_names='Chla_Fluorescence'
var_unit='(mg Chl m$^{-3}$)'
hlimn=3
pathd='obs_gbr_jan2020\MMP_2020\'


sites={'Dunk859_5m','Pandora_5m','Fitz_5m','Russell_5m','GeoffreyBay336_5m','Pelorus_5m', ...
    'DoubleCone_5m','High_5m','Pine_5m'}


%sites0={'Dunk_5m','Pandora_5m','RM10','TUL10','BUR13','Fitz_5m','Russell_5m','WHI7','GeoffreyBay_5m','Pelorus_5m', ...
    %'DoubleCone_5m','High_5m','Pine_5m'}

sites1={'MMP_Dunk_02','MMP_Pandora_02','MMP_Fitz_Rf_02','MMP_Russell_02'...
    ,'MMP_Geoff_B_02','MMP_Pelorus_02','MMP_Dbl_Cone_02','MMP_High_02','MMP_Pine_02'}

pathn='MMP_fluorescence_2020'
%  bur13  
SITES = [
'Dunk-5m ',
'Pand-5m ',
'Fitz-5m ',
'Russ-5m ',
'Geoff-5m',
'Pelo-5m ',
'DblC-5m ',
'High-5m ',
'Pine-5m '];
%p0_reanalysis_polished_control_only_3p1_3p2
p0_reanalysis_polished_control_only_old_site_old_new_model
%p0_reanalysis_polished_new_sites_2exp_control
save mmp_2020_chla_flue.mat




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ltmp  DIP 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
set(0,'defaultTextInterpreter','latex');
%addpath('/home/mon126/matlab_perso')
%addpath('/home/mg/matlab/plum')


eii=0 % define the number of ensemble 
expi='nil'

t_in=datenum('12/01/2010')-datenum('1990-01-01 00:00:00')   %% 
t_out=datenum('11/30/2012')-datenum('1990-01-01 00:00:00') %% 


tracer_name = ('DIP');  
tracer_obs =  [4]; % column 2 in the s MMP sensor mooring
tracer_mod =  [13]; % column 13 is chla column in the model
tracer_modc =  [4]; % column 13 is chla column in the model
tracer_modc2 =  [4]; % column 13 is chla column in the model

var_name='DIP    '
var_names='DIP'
var_unit='(mg P m$^{-3})$'
hlimn=15
pathd='obs_gbr_jan2020\AIMS_LTM2020\LTMfrom1_3_2016\'

%sites = {'Pine329_20m','Pine329_0m','Pelorus686_28m','Pelorus686_0m','Russell695_20m','HighI697_20m','HighI697_0m','FitzCoral852_15m','FairleadBuoy518_0m','Yorkeys519_8m','Yorkeys519_0m','Green830_36m','Green830_0m','DoubleI520_18m','DoubleI520_0m','PortD_0m','PortD_15m'};% in order of latitude north to south
%sites0 = {'Pine_20m','Pine_0m','Pelorus_28m','Pelorus_0m','Russell_20m','HighI_20m','HighI_0m','FitzCoral_15m','FairleadBuoy_0m','Yorkeys_8m','Yorkeys_0m','Green_36m','Green_0','DoubleI_18m','DoubleI_0m','PortD_0m','PortD_15m'};% in order of latitude north to south

%sites = {'Pine329_20m','Pine329_0m','Pelorus686_28m','Pelorus686_0m','Russell695_20m','HighI697_20m','HighI697_0m','FitzCoral852_15m','FairleadBuoy518_0m','Yorkeys519_8m','Yorkeys519_0m','DoubleI520_18m','DoubleI520_0m','PortD_0m','PortD_15m'};% in order of latitude north to south
%sites0 = {'Pine_20m','Pine_0m','Pelorus_28m','Pelorus_0m','Russell_20m','HighI_20m','HighI_0m','FitzCoral_15m','FairleadBuoy_0m','Yorkeys_8m','Yorkeys_0m','DoubleI_18m','DoubleI_0m','PortD_0m','PortD_15m'};% in order of latitude north to south
%sites1={ 'MMP_Pine_20','MMP_Pine_20','MMP_Pelorus_28','MMP_Pelorus_02','MMP_Russel_20','MMP_High_20','MMP_High_02','MMP_Fitz_Rf_15','LTM_Fairlead_02','LTM_Yorkeys_8','LTM_Yorkeys_02','LTM_Dbl_I_18','LTM_Dbl_Is_02','LTM_Pt_Doug_02','LTM_Pt_Doug_15'}
pathn='AIMS_ltmp_nut_2020'

%% need AE04_0m.ts,AE04_23m.ts,AR01_0m.ts,AR02b_0m.ts,AR02b_10m.ts,AR03_0m.ts,AR03_12m.ts,BUR13_16.ts,...
%%  BUR13_6.ts,BUR5_0m.ts,BUR7_0m.ts,BUR7_12m.ts,BUR9_0m.ts,CapeTrib356_10m.ts
%  DoubleCone_23m.ts,DoubleCone334_10m.ts,DunkNth_0m.ts,DunkNth_7m.ts,
%  DunkSEast_0m.ts,DunkSEast_20m.ts,ER01_0m.ts,ER02b_0m.ts,ER03_0m.ts,ER03_15m.ts,
%GeoffreyBay336_5m.ts,Green830_40m.ts,KR01_0m.ts,
%,,KR02_0m.ts,NR04_0m.ts,NR04_17m.ts,NR05_0m..ts,Pandora_5m.ts
% PRBB_0m.ts,PRBB_19m.ts,PRN01_0m.ts,PRN02_0m.ts,PRN03_0m.ts,
%PRN03_17m,PRN04_0m.ts,
%PRN04_24m.ts,PRN05_0m.ts,PRN05_24m.ts,=RM10_7m.ts,RM11_0m.ts
%RM4_0m.tRM6_0m.ts,s,RM7_0m.ts,RM7_23m.ts,RM9_0m.ts,Russell695_10m.ts,
%SR03_0m.ts,SR03_8m.ts,SR04_0m.ts,SR04_12m.ts,SR05_0m.ts,SR05_15m.ts,
%TUL10_0m.ts,TUL10_6m.ts,TUL11_0m.ts,TUL2_0m.ts,TUL2_23m.ts,
%TUL4_0m.ts,
%TUL6_0m.ts,TUL6_7m.ts,TUL7_0m.ts,TUL8_0m.ts,TUL8_8m.ts,TUL9_0m.ts,
%WHI5_0m.ts,WHI5_14m.ts,WHI5_6m.ts,WHI6_0m.ts,WHI6_6m.ts,WHI7_16m.ts,WHI7_6m.ts

%obs 
sites={'CapeTrib_0m','PortD_0m','PortD_15m','DoubleI520_0m','DoubleI520_18m','Green830_0m',...
    'Yorkeys519_0m','Yorkeys519_8m','FairleadBuoy518_0m','FitzCoral852_0m','FitzCoral852_15m',...
    'HighI697_0m','Russell695_20m','Dunk859_5m','Pelorus686_0m','Pelorus686_28m',...
    'Pandora_0m','GeoffreyBay_0m','Pine329_0m','Pine329_20m'}

%3.0
%sites0={'DoubleCone_5m','DoubleI_0m','DoubleI_18m','Dunk_5m',...
%    'FairleadBuoy_0m','FitzCoral_0m','GeoffreyBay_5m',...
%'Green_0m','HighI_0m','Pandora_5m','Pelorus_0m','Pelorus_28m',...
%'Pine_0m','Pine_20m','PortD_0m','PortD_15m','RM10','Russell_20m',...
%'WHI7','Yongala_0','Yongala_26','Yorkeys_0m','Yorkeys_0m'}

%3.2
sites1={'LTM_Cape_Trib_02','LTM_Pt_Doug_02','LTM_Pt_Doug_15','LTM_Dbl_Is_02',...
    'LTM_Dbl_I_18','LTM_Green_02','LTM_Yorkeys_02','LTM_Yorkeys_8',...
    'LTM_Fairlead_02','MMP_Fitz_Rf_02','MMP_Fitz_Rf_15','MMP_High_02',...
    'MMP_Russel_20','MMP_Dunk_02','MMP_Pelorus_02','MMP_Pelorus_28',...
    'MMP_Pandora_02','MMP_Geoff_B_02','MMP_Pine_02','MMP_Pine_20'}
SITES = [
'CapeT-0m  ',
'PortD-0m  ',
'PortD-15m ',
'DblI-0m   ',
'DblI-18m  ',
'Green-0m  ',
'York-0m   ',
'York-8m   ',
'Fairl-0m  ',
'Fitz-0m   ',
'Fitz-15m  ',
'High-0m   ',
'Russ-20m  ',
'Dunk-5m   ',
'Pelo-0m   ',
'Pelo-28m  ',
'Pand-0m   ',
'Geoff-0m  ',
'Pine-0m   ',
'Pine-20m  ']

%p0_reanalysis_polished_control_only_3p1_3p2
p0_reanalysis_polished_control_only_old_site_old_new_model
%p0_reanalysis_polished_new_sites_2exp_control
save lmtp_DIP.mat


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ltmp  NH4
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
close all
set(0,'defaultTextInterpreter','latex');
%addpath('/home/mon126/matlab_perso')
%addpath('/home/mg/matlab/plum')


eii=0 % define the number of ensemble 
expi='nil'

t_in=datenum('12/01/2010')-datenum('1990-01-01 00:00:00')   %% 
t_out=datenum('11/30/2012')-datenum('1990-01-01 00:00:00') %% 


tracer_name = ('NH4');  
tracer_obs =  [2]; % column 2 in the s MMP sensor mooring
tracer_mod =  [13]; % column 13 is chla column in the model
tracer_modc =  [5]; % column 13 is chla column in the model
tracer_modc2 =  [5]; % column 13 is chla column in the model

var_name='NH4    '
var_names='NH4'
var_unit='(mg N m$^{-3})$'
hlimn=5
pathd='obs_gbr_jan2020\AIMS_LTM2020\LTMfrom1_3_2016\'

%sites = {'Pine329_20m','Pine329_0m','Pelorus686_28m','Pelorus686_0m','Russell695_20m','HighI697_20m','HighI697_0m','FitzCoral852_15m','FairleadBuoy518_0m','Yorkeys519_8m','Yorkeys519_0m','Green830_36m','Green830_0m','DoubleI520_18m','DoubleI520_0m','PortD_0m','PortD_15m'};% in order of latitude north to south
%sites0 = {'Pine_20m','Pine_0m','Pelorus_28m','Pelorus_0m','Russell_20m','HighI_20m','HighI_0m','FitzCoral_15m','FairleadBuoy_0m','Yorkeys_8m','Yorkeys_0m','Green_36m','Green_0','DoubleI_18m','DoubleI_0m','PortD_0m','PortD_15m'};% in order of latitude north to south

%sites = {'Pine329_20m','Pine329_0m','Pelorus686_28m','Pelorus686_0m','Russell695_20m','HighI697_20m','HighI697_0m','FitzCoral852_15m','FairleadBuoy518_0m','Yorkeys519_8m','Yorkeys519_0m','DoubleI520_18m','DoubleI520_0m','PortD_0m','PortD_15m'};% in order of latitude north to south
%sites0 = {'Pine_20m','Pine_0m','Pelorus_28m','Pelorus_0m','Russell_20m','HighI_20m','HighI_0m','FitzCoral_15m','FairleadBuoy_0m','Yorkeys_8m','Yorkeys_0m','DoubleI_18m','DoubleI_0m','PortD_0m','PortD_15m'};% in order of latitude north to south
%sites1={ 'MMP_Pine_20','MMP_Pine_20','MMP_Pelorus_28','MMP_Pelorus_02','MMP_Russel_20','MMP_High_20','MMP_High_02','MMP_Fitz_Rf_15','LTM_Fairlead_02','LTM_Yorkeys_8','LTM_Yorkeys_02','LTM_Dbl_I_18','LTM_Dbl_Is_02','LTM_Pt_Doug_02','LTM_Pt_Doug_15'}
pathn='AIMS_ltmp_nut_2020'

%% need AE04_0m.ts,AE04_23m.ts,AR01_0m.ts,AR02b_0m.ts,AR02b_10m.ts,AR03_0m.ts,AR03_12m.ts,BUR13_16.ts,...
%%  BUR13_6.ts,BUR5_0m.ts,BUR7_0m.ts,BUR7_12m.ts,BUR9_0m.ts,CapeTrib356_10m.ts
%  DoubleCone_23m.ts,DoubleCone334_10m.ts,DunkNth_0m.ts,DunkNth_7m.ts,
%  DunkSEast_0m.ts,DunkSEast_20m.ts,ER01_0m.ts,ER02b_0m.ts,ER03_0m.ts,ER03_15m.ts,
%GeoffreyBay336_5m.ts,Green830_40m.ts,KR01_0m.ts,
%,,KR02_0m.ts,NR04_0m.ts,NR04_17m.ts,NR05_0m..ts,Pandora_5m.ts
% PRBB_0m.ts,PRBB_19m.ts,PRN01_0m.ts,PRN02_0m.ts,PRN03_0m.ts,
%PRN03_17m,PRN04_0m.ts,
%PRN04_24m.ts,PRN05_0m.ts,PRN05_24m.ts,=RM10_7m.ts,RM11_0m.ts
%RM4_0m.tRM6_0m.ts,s,RM7_0m.ts,RM7_23m.ts,RM9_0m.ts,Russell695_10m.ts,
%SR03_0m.ts,SR03_8m.ts,SR04_0m.ts,SR04_12m.ts,SR05_0m.ts,SR05_15m.ts,
%TUL10_0m.ts,TUL10_6m.ts,TUL11_0m.ts,TUL2_0m.ts,TUL2_23m.ts,
%TUL4_0m.ts,
%TUL6_0m.ts,TUL6_7m.ts,TUL7_0m.ts,TUL8_0m.ts,TUL8_8m.ts,TUL9_0m.ts,
%WHI5_0m.ts,WHI5_14m.ts,WHI5_6m.ts,WHI6_0m.ts,WHI6_6m.ts,WHI7_16m.ts,WHI7_6m.ts

%obs 
sites={'CapeTrib_0m','PortD_0m','PortD_15m','DoubleI520_0m','DoubleI520_18m','Green830_0m',...
    'Yorkeys519_0m','Yorkeys519_8m','FairleadBuoy518_0m','FitzCoral852_0m','FitzCoral852_15m',...
    'HighI697_0m','Russell695_20m','Dunk859_5m','Pelorus686_0m','Pelorus686_28m',...
    'Pandora_0m','GeoffreyBay_0m','Pine329_0m','Pine329_20m'}

%3.0
%sites0={'DoubleCone_5m','DoubleI_0m','DoubleI_18m','Dunk_5m',...
%    'FairleadBuoy_0m','FitzCoral_0m','GeoffreyBay_5m',...
%'Green_0m','HighI_0m','Pandora_5m','Pelorus_0m','Pelorus_28m',...
%'Pine_0m','Pine_20m','PortD_0m','PortD_15m','RM10','Russell_20m',...
%'WHI7','Yongala_0','Yongala_26','Yorkeys_0m','Yorkeys_0m'}

%3.2
sites1={'LTM_Cape_Trib_02','LTM_Pt_Doug_02','LTM_Pt_Doug_15','LTM_Dbl_Is_02',...
    'LTM_Dbl_I_18','LTM_Green_02','LTM_Yorkeys_02','LTM_Yorkeys_8',...
    'LTM_Fairlead_02','MMP_Fitz_Rf_02','MMP_Fitz_Rf_15','MMP_High_02',...
    'MMP_Russel_20','MMP_Dunk_02','MMP_Pelorus_02','MMP_Pelorus_28',...
    'MMP_Pandora_02','MMP_Geoff_B_02','MMP_Pine_02','MMP_Pine_20'}
SITES = [
'CapeT-0m  ',
'PortD-0m  ',
'PortD-15m ',
'DblI-0m   ',
'DblI-18m  ',
'Green-0m  ',
'York-0m   ',
'York-8m   ',
'Fairl-0m  ',
'Fitz-0m   ',
'Fitz-15m  ',
'High-0m   ',
'Russ-20m  ',
'Dunk-5m   ',
'Pelo-0m   ',
'Pelo-28m  ',
'Pand-0m   ',
'Geoff-0m  ',
'Pine-0m   ',
'Pine-20m  ']

%p0_reanalysis_polished_control_only_3p1_3p2
p0_reanalysis_polished_control_only_old_site_old_new_model
%p0_reanalysis_polished_new_sites_2exp_control
save lmtp_NH4.mat


