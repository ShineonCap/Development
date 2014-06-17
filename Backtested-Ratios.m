%% Input Daily End-of-Day Accumulated NetPnL=Accumulated PnL -Accumulated Commission Fee
totalDailyPnL=data(:,5);


%% Initiate the Original Portfolio Value
initialValue=1000000;


%%
numberDays=size(totalDailyPnL,1);
portfolioValue=zeros(numberDays+1,1);
portfolioValue(1)=initialValue;
portfolioValue(2:end)=totalDailyPnL+initialValue;
dailyReturn=portfolioValue(2:end)./portfolioValue(1:end-1)-1;


















%%% Annualized Rate of Return
annualizedReturn=(portfolioValue(end)/portfolioValue(1))^(252/(size(portfolioValue,1)-1))-1;


%%% Daily Rate of Return
dailyReturn=(portfolioValue(end)/portfolioValue(1))^(1/(size(portfolioValue,1)-1))-1;


%%% Histogram
hist(dailyReturn,30);


%%% Annualized Volatility
dailyStdev=std(dailyReturn);
annualizedStdev=dailyStdev*sqrt(252);


%%% Count #of Trading Days with Positive/Negative Rate of Return    P.S. Not include zero ones
numberPositiveDailyReturn=size(dailyReturn(dailyReturn>0),1);
numberNegativeDailyReturn=size(dailyReturn(dailyReturn<0),1);


%%% Means of Daily Positive/Negative Return
avgPosDaiRet=mean(dailyReturn(dailyReturn>0));
avgNegDaiRet=mean(dailyReturn(dailyReturn<0));


%%% Volatilities of Daily Positive/Negative Return
stdPosDaiRet=std(dailyReturn(dailyReturn>0));
stdNegDaiRet=std(dailyReturn(dailyReturn<0));




            
























%%% Drawdowns
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




%%
subplot(2,1,1);
plot(portfolioValue);
title('PortfolioValue');
grid on;
axis tight;


















% Sharpe Ratio   P.S. Annualized Risk-free Rate assumed to be 3.3%
Sharpe_Ratio=(annualizedReturn-0.033)/annualizedStdev;




%Sortino Ratio
Sortino_Ratio=(annualizedReturn-0.033)/(stdNegDaiRet*sqrt(252));
