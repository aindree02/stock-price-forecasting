
Task 3: Time Series Forecasting for Share Prices
Scenario
As a Data Scientist, you were tasked with conducting time series analysis for forecasting the share price movements of Agilent Technologies, Inc. The goal was to develop a predictive model using historical stock price data to forecast future trends.

Dataset
The dataset consists of daily stock prices, including the following features:

Open Price: Opening share price of the day
Close Price: Closing share price of the day
High & Low Prices: Highest and lowest prices during the trading day
Volume: Total number of shares traded
Methodology
Data Exploration

Conducted time series visualization of share price trends.
Calculated rolling averages to identify patterns and trends.
Time Series Decomposition

Decomposed the time series into trend, seasonality, and residual components to analyze underlying patterns.
Model Selection

Applied ARIMA (AutoRegressive Integrated Moving Average).
Applied ETS (Exponential Smoothing State Space Model).
Assumption Testing

Performed Augmented Dickey-Fuller (ADF) test to check for stationarity.
Visualized AutoCorrelation Function (ACF) and Partial AutoCorrelation Function (PACF) plots.
Model Comparison

Evaluated forecast accuracy using metrics like RMSE (Root Mean Squared Error) and AIC (Akaike Information Criterion).
Selected the best-performing model based on forecast accuracy.

Results & Findings
Non-stationarity detected in raw stock price data, requiring transformations.
ARIMA model performed better than ETS for short-term forecasting.
Differencing techniques improved stationarity, making the model more reliable.
