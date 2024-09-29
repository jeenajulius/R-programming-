
install.packages("forecast")
library(forecast)
library(ggplot2)

set.seed(123)
n_months <- 36

time <- seq(from = as.Date("2021-01-01"), by = "month", length.out= n_months)
sales <- ts(rnorm(n_months, mean = 2000, sd = 500), frequency = 12, start = c(2021, 1))

sales_data <- data.frame(Date = time, Sales = as.numeric(sales))
head(sales_data)

ggplot(sales_data, aes(x=Date, y=Sales))+
  geom_line()+
  labs(title = "Monthly Sales Data", x = "Date", y="Sales")+
  theme_minimal()

fit<-auto.arima(sales)
summary(fit)

forecast_period<-24
sales_forecast<-forecast(fit,h=forecast_period)

print(sales_forecast)

autoplot(sales_forecast)+
  ggtitle("sales forecasting using arima")+
  xlab("Date")+
  ylab("Sales")+
  theme_minimal()
  
checkresiduals(fit)
accuracy(fit)
  
