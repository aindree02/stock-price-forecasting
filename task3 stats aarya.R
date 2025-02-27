library(ggplot2)
library(zoo)
library(tseries)
library(forecast)
install.packages("forecast")
install.packages("forecast")





data <- read.csv("/Users/vishnug/Desktop/desktop 1/desktop1/other people assignment/sherrif friend/stats/task 3/A.csv")

# View the first few rows of the data
head(data)


# Check for missing values
sum(is.na(data))

# Convert the Date column to Date format 
data$Date <- as.Date(data$Date)


# Create a time series plot for the Close prices
ggplot(data, aes(x = Date, y = Close)) +
  geom_line(color = "blue") +
  labs(title = "Time Series Plot of Close Prices",
       x = "Date",
       y = "Close Price") +
  theme_minimal()





# Convert the data to a time series object with daily frequency
ts_data <- ts(data$Close, frequency = 365, start = c(1999, as.numeric(format(data$Date[1], "%j"))))

# Decompose the time series
decomposed_data <- decompose(ts_data, type = "multiplicative") # use type="additive" if no strong trend/seasonality

# Plot the decomposition
plot(decomposed_data)





# Set the rolling window size (e.g., 30 days)
window_size <- 30

# Calculate the rolling mean and rolling standard deviation for the Close price
data$Rolling_Mean <- rollmean(data$Close, k = window_size, fill = NA)
data$Rolling_SD <- rollapply(data$Close, width = window_size, FUN = sd, fill = NA)

# Plot the rolling mean and rolling standard deviation
plot(data$Date, data$Close, type = "l", col = "blue", main = "Rolling Mean and Standard Deviation",
     ylab = "Close Price", xlab = "Date")
lines(data$Date, data$Rolling_Mean, col = "red", lwd = 2)       # Rolling mean
lines(data$Date, data$Rolling_SD, col = "green", lwd = 2)       # Rolling standard deviation
legend("topright", legend = c("Close Price", "Rolling Mean", "Rolling SD"),
       col = c("blue", "red", "green"), lty = 1, lwd = 2)







# Perform the Augmented Dickey-Fuller test on the Close price
adf_result <- adf.test(data$Close, alternative = "stationary")

# Display the result
print(adf_result)






# Calculate a 30-day rolling mean for trend analysis
data$Rolling_Mean <- rollmean(data$Close, k = 30, fill = NA)

# Plot the closing prices and the rolling mean
ggplot(data, aes(x = Date)) +
  geom_line(aes(y = Close), color = "blue", alpha = 0.6) +
  geom_line(aes(y = Rolling_Mean), color = "red", size = 1) +
  labs(title = "Closing Prices with 30-Day Moving Average",
       x = "Date",
       y = "Close Price") +
  theme_minimal()





# Plot the trading volume over time
ggplot(data, aes(x = Date, y = Volume)) +
  geom_bar(stat = "identity", fill = "steelblue", alpha = 0.7) +
  labs(title = "Trading Volume Over Time",
       x = "Date",
       y = "Volume") +
  theme_minimal()




# Create a new column for month and year
data$Month <- format(data$Date, "%Y-%m")

# Calculate monthly average close price
monthly_data <- aggregate(Close ~ Month, data = data, mean)

# Convert Month column back to Date format for plotting
monthly_data$Month <- as.Date(paste0(monthly_data$Month, "-01"))

# Plot monthly average close price
ggplot(monthly_data, aes(x = Month, y = Close)) +
  geom_line(color = "purple", size = 1) +
  labs(title = "Monthly Average Closing Price",
       x = "Month",
       y = "Average Close Price") +
  theme_minimal()







# Suppress the xts warning about dplyr's lag function
options(xts.warn_dplyr_breaks_lag = FALSE)

# Load the necessary libraries
library(quantmod)

# Create an xts object for OHLC data
data_xts <- xts(data[, c("Open", "High", "Low", "Close")], order.by = data$Date)

# Plot the candlestick chart
chartSeries(data_xts, type = "candlesticks", theme = chartTheme("white"),
            TA = NULL, name = "OHLC Candlestick Chart")






# Calculate daily returns
data$Daily_Return <- c(NA, diff(log(data$Close)))

# Plot histogram of daily returns
ggplot(data, aes(x = Daily_Return)) +
  geom_histogram(bins = 50, fill = "dodgerblue", color = "black", alpha = 0.7) +
  labs(title = "Distribution of Daily Returns",
       x = "Daily Return",
       y = "Frequency") +
  theme_minimal()







# Load the necessary library for ACF and PACF plots
library(forecast)

# Plot ACF and PACF
par(mfrow = c(1, 2)) # Set plot layout to side-by-side
Acf(data$Close, main = "ACF of Closing Prices")
Pacf(data$Close, main = "PACF of Closing Prices")
par(mfrow = c(1, 1)) # Reset plot layout







# Convert the Close price to a time series object with daily frequency
ts_data <- ts(data$Close, frequency = 365, start = c(1999, as.numeric(format(data$Date[1], "%j"))))

# Decompose using STL
stl_decomposition <- stl(ts_data, s.window = "periodic")

# Plot STL decomposition
plot(stl_decomposition, main = "Seasonal Decomposition of Closing Prices")







# Extract the month from the date
data$Month_Factor <- format(data$Date, "%b")  

# Plot boxplot by month
ggplot(data, aes(x = Month_Factor, y = Close)) +
  geom_boxplot(fill = "lightgreen", color = "darkgreen") +
  labs(title = "Monthly Seasonality in Closing Prices",
       x = "Month",
       y = "Close Price") +
  theme_minimal()





installed.packages()["forecast", ]
install.packages("forecast")
library(forecast)
ls("package:forecast")
install.packages("remotes")
remotes::install_github("robjhyndman/forecast")
library(forecast)





# Generate sample time series data for testing
ts_data <- ts(rnorm(100), frequency = 365)

# Fit ARIMA model
best_arima_model <- auto.arima(ts_data)

# Print model to verify success
print(best_arima_model)








# Fit the ETS model
ets_model <- ets(ts_data)

# Display the ETS model summary
summary(ets_model)









# Install ggplot2 if not already installed
install.packages("ggplot2")

# Load the ggplot2 package
library(ggplot2)

# Install and load necessary packages
install.packages("forecast")
install.packages("ggplot2")
library(forecast)
library(ggplot2)

# Generate example time series data
set.seed(123)
sample_ts <- ts(rnorm(100), frequency = 365)

# Fit ETS model
sample_ets_model <- ets(sample_ts)

# Forecast the next 30 periods
sample_forecast <- forecast(sample_ets_model, h = 30)

# Plot the forecast with custom title and labels
autoplot(sample_forecast) +
  ggtitle("Example ETS Forecast") +
  xlab("Time") +
  ylab("Value") +
  theme_minimal()
