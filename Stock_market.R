# Load required libraries
library(quantmod)
library(forecast)
library(ggplot2)
library(urca)
library(zoo)

# Define stock symbol and date range
stock_symbol <- "AAPL"
start_date <- "2010-01-01"
end_date <- Sys.Date()

# Get stock data
getSymbols(stock_symbol, src = 'yahoo', from = start_date, to = end_date)
stock_data <- Cl(get(stock_symbol))  # Closing prices

# Remove missing values if any
stock_data <- na.omit(stock_data)

# Convert to univariate time series explicitly
stock_data_ts <- ts(as.vector(stock_data), frequency = 252)

# Convert xts object to a data frame for ggplot
stock_data_df <- data.frame(
  Date = as.Date(index(stock_data)),  # Ensure Date is in correct format
  StockPrice = coredata(stock_data)  # Extract the stock prices
)

# Ensure the column names are correct
colnames(stock_data_df) <- c("Date", "StockPrice")

# Plot stock price using ggplot
ggplot(stock_data_df, aes(x = Date, y = StockPrice)) + 
  geom_line(color = 'blue') +
  labs(title = paste("Stock Price of", stock_symbol),
       x = "Date", y = "Stock Price") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

# STL decomposition of the stock data
stock_decomposition <- stl(stock_data_ts, s.window = "periodic")
autoplot(stock_decomposition) + 
  labs(title = "STL Decomposition of Stock Price", x = "Date", y = "Price")

# Perform ADF test (Unit Root Test)
adf_test <- ur.df(stock_data_ts, type = "drift", selectlags = "AIC")
summary(adf_test)

# Fit ARIMA model
fit_arima <- auto.arima(stock_data_ts)

# Check ARIMA model residuals
checkresiduals(fit_arima)

# Forecast the next 30 days
forecast_arima <- forecast(fit_arima, h = 30)

# Plot the ARIMA forecast
autoplot(forecast_arima) + 
  labs(title = paste("ARIMA Forecast for", stock_symbol), 
       x = "Date", y = "Stock Price") +
  theme_minimal() +
  theme(plot.title = element_text(hjust = 0.5))

# ACF and PACF plots
par(mfrow = c(1, 2))
acf(stock_data_ts, main = "ACF Plot")
pacf(stock_data_ts, main = "PACF Plot")

