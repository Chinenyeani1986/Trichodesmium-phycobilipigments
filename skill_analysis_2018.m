function skill = skill_analysis_ts_MAPE(x1,x2,y1,y2)

%
% Script to compare and evaluate the errors between two time series. 
% The script calculates model skill, d2 (Willmott et al. (1985), 
% mean absolute error (MAE), root-mean-square (rms) error, bias and
% correlation coefficient.
% 
%
% Usage:    function skill = skill_analysis_ts(x1,x2,y1,y2)
%
% where     x1, x2 are vectors containing times (datenum format) of the time series
%           y1, y2 are vectors or arrays of time series data (y1 =
%           observed, y2 = modelled).
%
% Output:   
%           skill.d2 = model skill (Willmott et al., 1985)
%           skill.rms = root-mean-square error.
%           skill.r = correlation coefficient (at 95%).
%           skill.mae = mean absolute error.
%           skill.bias = bias.
%
% If y1 and y2 are arrays i.e. multiple data time series, an extra column
% is added to the output arrays, containing the estimated overall
% error/skill.
%

%% Check to see if the data sets are contemporaneous and, if not, make them so.

% round off time stamps to nearest minute, to avoid truncation/roundoff errors
x1 = round(x1 * 24 * 60) / (24 * 60);
x2 = round(x2 * 24 * 60) / (24 * 60);

% set limit (minutes) for matching times between observed and modelled time series.
% If the difference between time stamps for two records exceeds this limit,
% the data records are not considered contemporaneous.
dt_lim = 1;

% convert to days
dt_lim = dt_lim / (24 * 60);
x1_dt = x1(2) - x1(1);
x2_dt = x2(2) - x2(1);
if dt_lim >= x1_dt | dt_lim >= x2_dt
    disp('Error: Specified critical time difference is greater than one or more time series time interval');
    return
end

% find the contamporaneous period between the two time series
xstart = max(x1(1),x2(1));
xstop = min(x1(end),x2(end));
if xstop < xstart
    disp('Error: Modelled and observed data not contemporaneous')
    return
end

% Adjust start and stop by the time matching limit
xstart = xstart - dt_lim;
xstop = xstop + dt_lim;

% Truncate all records to fit the common data range
id1 = find(x1 >= xstart & x1 <= xstop);
id2 = find(x2 >= xstart & x2 <= xstop);
x1 = x1(id1); y1 = y1(id1,:);
x2 = x2(id2); y2 = y2(id2,:);


% Are the truncated time series of the same length ?
% If so, do the time stamps match.
% If not, interpolate the modelled data onto the observed time record.
if length(x1) == length(x2) 
    x_diff = x2 - x1;
    %figure;plot(x_diff)
    if max(x_diff) == 0 & min(x_diff) == 0
        y2_interp = y2;
    else
        y2_interp = interp1(x2,y2,x1,'PCHIP');
    end
else
    %figure;plot(x2)
    %figure;plot(x1)
    y2_interp = interp1(x2,y2,x1,'PCHIP');
    %figure;plot(y2_interp)
    %figure;plot(y2)

end
y2 = y2_interp; 
%figure;plot(y2)
x2 = x1;  
%figure;plot(x2)
%% End of data matching/interpolation

%% Calculate the model errors and skill.
% Get the difference between observed and modelled time series
Dif(:,:) = (y2 - y1);
[Nrow Ncol] = size(Dif);

% pick out NaNs in data and adjust to zero for summing
iNaNDif = isfinite(Dif);
Nrow = Nrow * ones(1,Ncol);
Nrow = sum(iNaNDif);
Dif(isnan(Dif)) = 0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate mean observed value from non-NaN data
for j = 1:Ncol
    ybar(j) = mean(y1(iNaNDif(:,j),j))
end
% Calculate stdev  observed value from non-NaN data
for j = 1:Ncol
    ostdev(j) = std(y1(iNaNDif(:,j),j))
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate mean model value 

% for j = 1:Ncol
%     ybarm(j) = mean(y2(iNaNDif(:,j),j))
% end

for j = 1:Ncol
    ybarm(j) = mean(y2) 
end
% Calculate stdev  observed value from model data
for j = 1:Ncol
    mstdev(j) = std(y2(iNaNDif(:,j),j))
end
%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Calculate the model bias
bias(1:Ncol) = sum(Dif,1) ./ Nrow;

% Calculate the overall bias
if Ncol > 1
    bias(Ncol+1) = sum(sum(Dif)) / sum(Nrow);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

% Calculate the mean absolute error
mae(1:Ncol) = sum(abs(Dif),1) ./ Nrow;

% Calculate the overall MAE
if Ncol > 1
    mae(Ncol+1) = sum(sum(abs(Dif))) / sum(Nrow);
end

%%%%%%%%%%%%


% jen Calculate the mean absolute percentage error first attempt (wrong as
% using MAE see below RMS for mape2
mape(1:Ncol) = sum(abs(Dif),1) ./ Nrow / ybar(j); %jen

% jen Calculate the overall MAPE
if Ncol > 1 %jen
    mape(Ncol+1) = (sum(sum(abs(Dif))) / sum(Nrow)) / ybar(j)*100;%jen
 abs(Dif)   
end


%%%%%%%%%%%

% Calculate Root Mean Square Error (rms) 
Difsq = Dif .* Dif;
rms(1:Ncol) = sqrt(sum(Difsq,1) ./ Nrow);
% Calculate the overall RMS error
if Ncol > 1
    rms(Ncol+1) = sqrt(sum(sum(Difsq)) / sum(Nrow));
end

%%%%%%%%%%
%mark MAPE2 second attempt using RMS
%pct_abs_err = mean(100 * abs((obs-model)./obs)) %Jen

index = find(y1>0);

mape2(1:Ncol) = 100*(nanmean(abs(y1(index)-y2(index))./y1(index)))
if Ncol > 1
    mape2(Ncol+1) = 100*(nanmean(abs(y1(end)-y2(end))./y1(end)))
end

% mape2(1:Ncol)=( (sqrt(sum(Difsq,1)) ./ (Nrow) ) /   ybar(j))*100;%jen
% if Ncol > 1 
%     mape2(Ncol+1) =( ((sqrt(sum(sum(Difsq) ))) / sum(Nrow)) / ybar(j));%jen
%     abs(Dif)
% end





% Calculate a dimensionless skill score (d2). 0 = complete disagreement, 1 = perfect agreement.
for j = 1:Ncol
    %below line is Phil original
    denom = sum((abs(y2(iNaNDif(:,j),j)-ybar(j)) + abs(y1(iNaNDif(:,j),j)-ybar(j))).^2);
    %denom = sum((abs(y1(iNaNDif(:,j),j)-ybar(j))).*2)%jen2
    num = sum(Difsq(:,j)) 
    if denom > 0 & isfinite(num)
        %d2(j) = 1 - (sum(Difsq(:,j)) ./ denom);%original
        d2(j) = 1 - (num ./ denom);%jen
    elseif denom == 0 & num == 0
        d2(j) = NaN;
    else
        d2(j) = 0;
    end
end

% Calculate the overall model skill
if Ncol > 1
    d2(Ncol+1) = sum(d2(1:Ncol) .* Nrow) / sum(Nrow);
end

% Calculate the cross-correlation coefficients
for icol = 1:Ncol
    datacols = [y1(:,icol) y2(:,icol)];
    idnan1 = isnan(datacols(:,1));
    idnan2 = isnan(datacols(:,2));
    idnan = idnan1 | idnan2;
    datacols = datacols(~idnan,:);
    [r1 p] = corrcoef(datacols);
    r(icol) = r1(1,2);
end

% Calculate the overall correlation 
r(Ncol+1) = sum(r(1:Ncol) .* Nrow) / sum(Nrow);

% save results to file and in output array
%save('skills_analysis.dat','rms','d','r','-ASCII')
skill.d2 = d2;
skill.mae = mae;
skill.mape = mape;
skill.mape2 = mape2;
skill.rms = rms;
skill.r = r;
skill.bias = bias;
skill.ybar = ybar
skill.ybarm = ybarm
skill.mstdev = mstdev
skill.ostdev = ostdev

%%

end
