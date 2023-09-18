% This is 2019 script for Chlorophyll HPLC  at the NRS sites version 3p0
% including ensemble 
% Created by Jenny Skerratt & Mathieu Mongin (CSIRO, hobart)
% Modified by Chinenye Ani

t_in_tick=t_in+datenum('1990-01-01 00:00:00')  %%
t_out_tick=t_out+datenum('1990-01-01 00:00:00')  %% 
clear s datao datam dataS dataDA1ens 

for i=1:length(sites)   
    % load  the observation ts files 
    try
     obs_file = strcat(pathd,sites{i},'.ts'); % observ   
         [heado,datao]=hdrload(obs_file);
    catch 
    
       obs_file = strcat(pathd,sites0{i},'.ts'); % observ   
         [heado,datao]=hdrload(obs_file);  
    end
   
        % load the old model run 
        
 
    mod_file2 = strcat('ts_3p2\',sites1{i},'.ts'); %mod2  
    [headm2,datam2]=hdrload(mod_file2); 
        
        % load the  run new model   control
 %   mod_file3 = strcat('ts_3p2/',sites1{i},'.ts'); %mod3   
   mod_file3 = strcat('ts_photoacclimate\',sites1{i},'.ts'); %mod3   
    [headm3,datam3]=hdrload(mod_file3);    

    
    
   % [headm,datam]=hdrload(mod_file1);    
   
    % get the index for the required ti eperiod
    tind_mod2 = find(datam2(:,1) >=t_in  & datam2(:,1) <= t_out ); 
    tind_mod3 = find(datam3(:,1) >=t_in  & datam3(:,1) <= t_out ); 

    %convert time to matlab format
    datao(:,1) = datenum('1990-01-01 00:00:00')+datao(:,1);
    datam2(:,1) = datenum('1990-01-01 00:00:00')+datam2(:,1);
    datam3(:,1) = datenum('1990-01-01 00:00:00')+datam3(:,1);
  
    %% only take the control run for the dedicated time period  dataS in the control run
    dataS2=datam2(tind_mod2,:);
    dataS3=datam3(tind_mod3,:);
      
        
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% first plot just a time series of all the member + control :
        
    set(gca,'FontSize',26);
    marg=0.05;
    set(0,'Units','centimeters')
    figure('position',[1 1 1900 900])
    set(gcf,'color','w')
    set(0,'defaultAxesFontName', 'Arial')
    %plot(datao(:,1),datao(:,tracer_obs), '.k', 'MarkerSize',18); 
    %plot(dataS2(:,1),squeeze(dataS2(:,tracer_modc)), 'Color', [1 0.2 0.2 0.2], 'DisplayName','GBR4-BGC','linewidth',3) %red
    plot(dataS2(:,1),squeeze(dataS2(:,tracer_modc)), 'Color', [0.8500 0.3250 0.0980 0.2], 'DisplayName','GBR4-BGC-sph','linewidth',3)

    hold on
    %plot(dataS2(:,1),squeeze(dataS2(:,tracer_modc)), 'Color', 'green', 'DisplayName','GBR4-BGC','linewidth',3)
    %plot(dataS3(:,1),squeeze(dataS3(:,tracer_modc2)), 'Color', [0 0.5 1 0.2], 'DisplayName', 'modified GBR4-BGC', 'linewidth',3); %blue
    plot(dataS3(:,1),squeeze(dataS3(:,tracer_modc2)), 'Color', [0 0.4470 0.7410 0.2], 'DisplayName', 'GBR4-BGC-cyl', 'linewidth',3); 
    plot(datao(:,1),datao(:,tracer_obs), '.k', 'DisplayName', 'observations', 'MarkerSize',23);

    hold off
     axis([dataS3(1,1) dataS3(end,1)  0 hlimn]);

    datetick('x','mmm/yy','keeplimits','keepticks');
    ylabel([var_name,' ',var_unit], 'FontSize', 26,'FontName','Arial')
    set(gca,'FontSize',26);
    hold off
    %title([{SITES(i,:)};{'GBR4-BGC (green)  modified GBR4-BGC (blue) '};{' & observations (black)'}],'FontSize',8,'FontName','Arial')
    legend('show','Location','northeast')
    name0 = strcat('png_figures_old_photoacclimate_model\',pathn,'\time_series_MMP_',var_names,'_',SITES(i,:),'.png');
    print(name0,'-dpng');



               
       skill_3p2(i,:)=skill_analysis_2018(datao(:,1),dataS2(:,1),datao(:,tracer_obs),squeeze(dataS2(:,tracer_modc))); % expa 
       skill_3p2b(i,:)=skill_analysis_2018(datao(:,1),dataS3(:,1),datao(:,tracer_obs),squeeze(dataS3(:,tracer_modc2)));  % control
    
        



    
        biasDA(1,i)=skill_3p2(i,:).bias % column 53 is 3.0 mean statistics   expa 
        biasDA(2,i)=skill_3p2b(i,:).bias % column 53 is 3.0 mean statistics   control

        
        rmsDA(1,i)=skill_3p2(i,:).rms
        rmsDA(2,i)=skill_3p2b(i,:).rms
        

        maeDA(1,i)=skill_3p2(i,:).mae
        maeDA(2,i)=skill_3p2b(i,:).mae

        d2DA(1,i)=skill_3p2(i,:).d2
        d2DA(2,i)=skill_3p2b(i,:).d2


s(i,:,1) = [d2DA(1,i),maeDA(1,i),rmsDA(1,i),biasDA(1,i) ];  %expa
s(i,:,2) = [d2DA(2,i),maeDA(2,i),rmsDA(2,i),biasDA(2,i) ];  %control


end
        figure(100)
        
        subplot(2,1,1)
        b=bar(squeeze(s(:,4,:)));
        b(1).FaceColor='c' %EXP A
        b(2).FaceColor='r' % control
        grid on
        set(gca,'XTick',[1:1:length(sites)])
        set(gca,'XTickLabel',{SITES},'Fontsize',6)
        set(gca,'XTickLabelRotation',90)
        ylabel(['Bias ',var_name,' ',var_unit],'FontSize',10,'FontName','Arial')
        %title('Bias MMP mooring fluorescence','FontSize',12,'FontWeight','bold')
        as=nanmean(squeeze(s(:,4,1)))
        line10=['  GBR4-BGC-sph: ',sprintf('%.2f',(as)),'   ']
        as=nanmean(squeeze(s(:,4,2)))     
        line11=['  GBR4-BGC-cyl: ',sprintf('%.2f',(as))]      
        %title([line10,line11],'FontSize',12,'FontWeight','bold')
        legend('GBR4-BGC-sph','GBR4-BGC-cyl','Location', 'northoutside','Orientation','horizontal')
        
        subplot(2,1,2)
        b=bar(squeeze(s(:,1,:)));
        b(1).FaceColor='c'
        b(2).FaceColor='r'
        grid on
        set(gca,'XTick',[1:1:length(sites)])
        set(gca,'XTickLabel',{SITES},'Fontsize',6)
        set(gca,'XTickLabelRotation',90)
        ylabel(['Willmott ',var_name,' '],'FontSize',10,'FontName','Arial')
        as=nanmean(squeeze(s(:,1,1)))
        line10=['  GBR4-BGC-sph: ',sprintf('%.2f',(as)),'   ']
        as=nanmean(squeeze(s(:,1,2)))       
        line11=['  GBR4-BGC-cyl: ',sprintf('%.2f',(as))]
        %title([ line10,line11],'FontSize',12,'FontWeight','bold')
        %legend('GBR4-BGC 3.2','modified GBR4-BGC 3.2','Location', 'bestoutside','Orientation','horizontal')
    
        set(gca,'XTickLabelRotation',90)
        name = strcat('png_figures_old_photoacclimate_model\',pathn,'\bias_d2_BAR_MMP_',var_names,'.png');
        print('-dpng',name);

        

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%             
        figure(101)
        subplot(2,1,1)
        b=bar(squeeze(s(:,3,:)));
        b(1).FaceColor='c'
        b(2).FaceColor='r'
        grid on
        %set(gca,'XTickLabel',{SITES},'Fontsize',6)
        set(gca,'XTick',[1:1:length(sites)])
        set(gca,'XTickLabel',{SITES},'Fontsize',6)
        set(gca,'XTickLabelRotation',90)

       ylabel(['RMS ', var_name,' ',var_unit],'FontSize',10,'FontName','Arial')

 %       as=nanmean(squeeze(s(:,3,1)))
  %      line9=['3.1: ',sprintf('%.2f',(as))]
        as=nanmean(squeeze(s(:,3,1)))
        line10=['  GBR4-BGC-sph: ',sprintf('%.2f',(as)),'   ']
        
        as=nanmean(squeeze(s(:,3,2)))
        line11=[' GBR4-BGC-cyl: ',sprintf('%.2f',(as))]        
        %title([line10,line11],'FontSize',12,'FontWeight','bold')       % legend('zsq 0.02','zsq 0.02 biodpeth 0.2','zsq 0.025','2.0','Fontsize',12)
        %legend(' GBR4-BGC 3.2','modified GBR4-BGC 3.2', 'Location', 'northoutside','Orientation','horizontal')
        set(gca,'XTickLabelRotation',90)
        
        subplot(2,1,2)
        b= bar(squeeze(s(:,2,:)));
        b(1).FaceColor='c'
        b(2).FaceColor='r'       
        grid on
        set(gca,'XTick',[1:1:length(sites)])
        set(gca,'XTickLabel',{SITES},'Fontsize',6)
        set(gca,'XTickLabelRotation',90)
        ylabel(['MAE ', var_name,' ',var_unit],'FontSize',10,'FontName','Arial')
        as=nanmean(squeeze(s(:,2,1)))
        line10=['  GBR4-BGC-sph: ',sprintf('%.2f',(as)),'   ']
        
        as=nanmean(squeeze(s(:,2,2)))
        line11=['  GBR4-BGC-cyl: ',sprintf('%.2f',(as))]

        
        %title([ line10,line11],'FontSize',12,'FontWeight','bold')        
        %legend('GBR4-BGC','modified GBR4-BGC', 'Location', 'bestoutside','Orientation','horizontal')
        set(gca,'XTickLabelRotation',90)
        name = strcat('png_figures_old_photoacclimate_model\',pathn,'\rms_mae_BAR_MMP_',var_names,'.png');
        print('-dpng',name);

        
% 
% 
% 
% 
