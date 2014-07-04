function vargout = scmDrawDown(data,varargin)

%% Help file
% comply to Matlab help file for the format
% scmDrawDown Computes drawdowns of a data series
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
opt = optParse(varargin);


% Default assumptions for options
% eg: 
%   range: compute the drawdowns of data in a certain time range, if it is
%       missing, compute the entire range
%   what is the data type: price or return? if missing, default to price or
%       return?
%   how many drawdowns to compute: default 1, maybe 2,3,4...
%   
% etc...


%% Data Validation
% ?what need to be checked for the data
% The Frequency is Daily.
% The class of the data is a n-by-m matrix,assuming the End-of-Day portfolio value is in the first column.





%% Computation
portfolioValue=data(:,1);


len=numel(portfolioValue);
drawdownRatio=zeros(len,1);
for i=2:len
  C=max(portfolioValue(1:i));
  if C==PortfolioValue(i)
      drawdownRatio(i)=0;
  else
      drawdownRatio(i)=(portfolioValue(i)-C)/C;
  end
end
%The Largest,2nd Largest,3rd Largest Drawdowns
maxDrawdownRatio=min(drawdownRatio); 
secondMaxDrawdownRatio=min(drawdownRatio(drawdownRatio>maxDrawdownRatio)); 
thirdMaxDrawdownRatio=min(drawdownRatio(drawdownRatio>secondMaxDrawdownRatio));
 
%When the three drawdown happened
thDayMax=find(drawdownRatio==maxDrawdownRatio);
thDaySecond=find(drawdownRatio==secondMaxDrawdownRatio);
thDayThird=find(drawdownRatio==thirdMaxDrawdownRatio);
%How long the three drawdown lasted
countDayMax=thDayMax-find(portfolioValue==max(portfolioValue(1:thDayMax)));
countDaySecond=thDaySecond-find(portfolioValue==max(portfolioValue(1:thDaySecond)));
countDayThird=thDayThird-find(portfolioValue==max(portfolioValue(1:thDayThird)));




%% Output
% what is the output class: same as the input class
% how many outputs: default 1, the maximum drawdown, if input is price,
%   output is price, if input is return, output is in returns
% if need the length and time of the drawdowns: also save the corresponding
%   time stamp







