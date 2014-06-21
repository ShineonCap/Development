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
%
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
% ?validate options, give warning/error messages

% ?if some necessary options are missing, make default assumptions for options
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
% what is the frequency?
% what if some data is missing?
% what is the class of the data (ts, fints, matrix)
% what is the dimension of the data
% etc...



%% Computation

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







