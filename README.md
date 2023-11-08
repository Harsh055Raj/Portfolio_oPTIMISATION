# Portfolio_OPTIMISATION

Portfolio optimization is a critical process in the field of finance with the primary goal of maximizing returns while effectively managing risk. Over time, traditional methodologies have formed the foundation of this process. Models such as Z-scores, Markowitz portfolio optimization, and Johansen cointegration tests have contributed strategies that minimize risk while yielding optimal returns.
This paper introduces an innovative approach that merges the principles of conventional portfolio optimization with the capabilities of Long Short-Term Memory (LSTM) networks. The core objective is to identify the most efficient allocation of assets in a portfolio by harnessing the strengths of both methodologies. The study commences by applying classical portfolio optimization techniques to establish a baseline portfolio.
The results of this study highlight how LSTM models are capable of adapting to changing market dynamics, much like their traditional counterparts. These models provide insights into the ideal weightings for different stocks, offering a pathway to achieve the desired financial outcomes. This approach represents a significant step forward in portfolio optimization, as it combines the stability of traditional methods with the adaptability and predictive power of deep learning through LSTM networks.



## JOHANSEN  CO-INTEGERATION TEST 

Cointegration is data testing that find’s if the there’s relationship between two or more Related series. A time-related series is several data points where one measurement is time The primary use of cointegration is to determine whether you perform a regression on two or more variables.Cointegeration can reduce the possibility that variables have a relationship that looks correlated but isn’t . Some of the methods to check the cointegration are Engle -Granger test (one of the initial methods and uses the regression to test it ). , next is Phillips-Ouliaris test (taking independent variable relation in consideration) and last there is Johansen test which uses eigen vectors matrix to provide the weights of the models . Below we can see the use of ADF test(augmented dickey fuller test to check for the stationarity of the stocks before and after we used Johansen test to get the weights , and after getting the weights we have multiplied it with the stock price to get the spread and check that if it Is stationary or not .

<img width="707" alt="Screenshot 2023-11-08 at 10 08 42 PM" src="https://github.com/Harsh055Raj/Portfolio_oPTIMISATION/assets/95955195/5e561ce0-2221-4252-b794-421bf4f40e0d">

With the help of weights from the Johansen co integeration test we are able to extract weights that makes our portfolio strategy stationary .

<img width="1030" alt="Screenshot 2023-11-08 at 10 10 40 PM" src="https://github.com/Harsh055Raj/Portfolio_oPTIMISATION/assets/95955195/33d17501-8eea-4215-afa4-3f516c1283c8">

## RESULT THAT WE WERE ABLE TO EXTRACT FROM THE LSTM MODEL .

Highly mean reverting result generated from the LSTM weight .


<img width="569" alt="Screenshot 2023-11-08 at 10 12 09 PM" src="https://github.com/Harsh055Raj/Portfolio_oPTIMISATION/assets/95955195/1135b4ea-ade1-4364-8e0d-2f5982c975be">


