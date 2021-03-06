function [sortinoRatio] = scmSortino(data)





%% Help file
% comply to Matlab help file for the format
% scmSortino Computes a ratio of a data series
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
annualizedReturn=(portfolioValue(len)/portfolioValue(1))^(252/(size(portfolioValue,1)-1))-1;


stdNegDaiRet=std(dailyReturn(dailyReturn<0));



%Sortino Ratio    P.S. Annualized Risk-free Rate assumed to be 3.3%
Sortino_Ratio=(annualizedReturn-0.033)/(stdNegDaiRet*sqrt(252));






%% Output
% what is the output class: same as the input class
% one output: the sortino ratio for the portfolio for the holding period

 
