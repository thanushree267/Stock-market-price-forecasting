# Stock Price Analysis and Forecasting

This repository contains R code to analyze and forecast stock prices using various statistical methods. The analysis is done on historical stock data for Apple Inc. (AAPL), but the code can be easily adapted for other stocks by changing the stock symbol.

## Requirements

The following R packages are required to run the analysis:

- `quantmod`: For downloading and managing financial data.
- `forecast`: For time series forecasting using ARIMA models.
- `ggplot2`: For visualizing the stock data and forecasts.
- `urca`: For conducting unit root tests (ADF test).
- `zoo`: For handling time series data.

Install the required packages using the following commands in R:
```r
install.packages(c("quantmod", "forecast", "ggplot2", "urca", "zoo"))
```

## Steps in the Code

1. **Data Acquisition**: 
   - The stock data for Apple Inc. (AAPL) is fetched from Yahoo Finance using the `quantmod` package.
   - The data is then cleaned to remove any missing values.

2. **Data Preparation**: 
   - The closing prices of the stock are extracted and converted into a univariate time series object.

3. **Visualization**: 
   - A time series plot of the stock price is created using `ggplot2`.

4. **STL Decomposition**: 
   - The stock data is decomposed into its seasonal, trend, and remainder components using STL (Seasonal and Trend decomposition using Loess) for better understanding of the underlying patterns.

5. **Unit Root Test**: 
   - The Augmented Dickey-Fuller (ADF) test is performed using the `urca` package to check for stationarity of the stock price series.

6. **ARIMA Model**: 
   - An ARIMA model is fitted to the time series using the `auto.arima` function from the `forecast` package. The model is then checked for residuals to ensure it’s a good fit.

7. **Forecasting**: 
   - A 30-day forecast of the stock price is generated using the ARIMA model, and the forecast is visualized.

8. **ACF and PACF**: 
   - The Autocorrelation Function (ACF) and Partial Autocorrelation Function (PACF) plots are shown to better understand the correlation structure of the stock price time series.

## Results

The code produces the following outputs:

1. **Stock Price Plot**: A time series plot showing the historical stock prices of AAPL.
2. **STL Decomposition Plot**: A plot showing the seasonal, trend, and residual components of the stock price.
3. **ADF Test Results**: The output of the Augmented Dickey-Fuller test showing if the stock price time series is stationary.
4. **ARIMA Forecast Plot**: A forecast plot showing the predicted stock prices for the next 30 days.
5. **ACF and PACF Plots**: Plots showing the autocorrelation structure of the stock price time series.

## How to Use

1. **Change Stock Symbol**: To analyze a different stock, change the `stock_symbol` variable to the desired ticker symbol (e.g., "GOOG" for Google).
2. **Adjust Date Range**: The start and end date for fetching stock data can be modified in the `start_date` and `end_date` variables.

Example:

```r
stock_symbol <- "GOOG"
start_date <- "2015-01-01"
end_date <- Sys.Date()
```

3. **Run the Script**: After setting your preferred stock symbol and date range, run the script to perform the analysis and generate the plots.
