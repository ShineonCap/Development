function [omegaRatio]=scmOmega(data)






%% Help file
% comply to Matlab help file for the format
% scmOmega Computes a ratio of a data series
%
% Syntax
%  
% Description
% 
% Input
% data is a n-by-m matrix/time series/ financial time series 
% assuming the 1st column is the End-of-Day Portfolio Value
% Options
% 
% Output
% 
%  
%
%See also 
%Author:
%Compatible with MATLAB version xxxxa/b




%% Pre-parse
%% ---------
% read options in struct




% Default assumptions for options










%% Data Validation


% The Frequency is Daily.
% The class of the data is a n-by-m matrix,assuming the End-of-Day portfolio value is in the first column.










%% Computation
portfolioValue=data(:,1);

len=numel(portfolioValue);
dailyReturn=price2ret(portfolioValue);




%Omega Ratio   P.S. Threshold rate of return is zero
sortedDailyReturn=sort(dailyReturn);
threshold=min(find(sortedDailyReturn>=0));
Omega_Ratio=(len-threshold+1)/(threshold-1);










%% Output
% what is the output class: same as the input class
% one output: the omega ratio for the portfolio for the holding period
