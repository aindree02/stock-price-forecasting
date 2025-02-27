Task 3: Time Series Forecasting for Share Prices
📌 Scenario
As a Data Scientist, you were tasked with conducting time series analysis for forecasting the share price movements of Agilent Technologies, Inc. The goal was to develop a predictive model using historical stock price data to forecast future trends.

📊 Dataset
The dataset consists of daily stock prices, including the following features:

🟢 Open Price: Opening share price of the day
🔴 Close Price: Closing share price of the day
🔼 High & Low Prices: Highest and lowest prices during the trading day
📊 Volume: Total number of shares traded
🛠 Methodology
1️⃣ Data Exploration
✔ Conducted time series visualization of share price trends.
✔ Calculated rolling averages to identify patterns and trends.

2️⃣ Time Series Decomposition
✔ Decomposed the time series into trend, seasonality, and residual components to analyze underlying patterns.

3️⃣ Model Selection
✔ Applied ARIMA (AutoRegressive Integrated Moving Average).
✔ Applied ETS (Exponential Smoothing State Space Model).

4️⃣ Assumption Testing
✔ Performed Augmented Dickey-Fuller (ADF) test to check for stationarity.
✔ Visualized AutoCorrelation Function (ACF) and Partial AutoCorrelation Function (PACF) plots.

5️⃣ Model Comparison
✔ Evaluated forecast accuracy using metrics like RMSE (Root Mean Squared Error) and AIC (Akaike Information Criterion).
✔ Selected the best-performing model based on forecast accuracy.

**Key Code Snippets**

# 📦 Load necessary libraries
library(forecast)
library(tseries)
library(ggplot2)
library(dplyr)

# 📂 Load dataset
stock_data <- read.csv("agilent_stock_prices.csv")

# 📅 Convert date column to Date format
stock_data$Date <- as.Date(stock_data$Date, format="%Y-%m-%d")

# 📈 Plot time series
ggplot(stock_data, aes(x = Date, y = Close)) + 
  geom_line(color = "blue") + 
  ggtitle("📊 Stock Price Over Time")

# 🛠 Check stationarity using Augmented Dickey-Fuller Test
adf.test(stock_data$Close)

# 🔍 Fit ARIMA model
arima_model <- auto.arima(stock_data$Close)
forecast_values <- forecast(arima_model, h=30)

# 📉 Plot forecast
plot(forecast_values)

📊 Results & Findings
✔ Non-stationarity detected in raw stock price data, requiring transformations.
✔ ARIMA model performed better than ETS for short-term forecasting.
✔ Differencing techniques improved stationarity, making the model more reliable.



