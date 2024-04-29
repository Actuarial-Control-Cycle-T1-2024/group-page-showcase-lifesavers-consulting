# Install and load necessary packages
install.packages("forecast")
library(forecast)
library(dplyr)
library(ggplot2)

# Create a time series object from the data
data <- data.frame(
  Year = 1962:2023,
  Inflation = c(0.0267, 0.0237, 0.0267, 0.0341, 0.0317, 0.0315, 0.0318, 0.0315, 0.0454, 0.0520, 0.0554, 0.0795, 0.1262, 0.0891, 0.0722, 0.0835, 0.0737, 0.0806, 0.1255, 0.1129, 0.0763, 0.0734, 0.0616, 0.0425, 0.0273, 0.0356, 0.0506, 0.0569, 0.0643, 0.0482, 0.0508, 0.0432, 0.0424, 0.0373, 0.0361, 0.0267, 0.0253, 0.0208, 0.0252, 0.0330, 0.0199, 0.0207, 0.0248, 0.0272, 0.0320, 0.0282, 0.0463, 0.0063, 0.0176, 0.0369, 0.0230, 0.0166, 0.0117, 0.0019, 0.0064, 0.0164, 0.0187, 0.0171, 0.0075, 0.0316, 0.0741, 0.0665),
  Government_Overnight_Rate = c(0.0310, 0.0378, 0.0398, 0.0448, 0.0593, 0.0484, 0.0622, 0.0902, 0.0830, 0.0504, 0.0504, 0.0970, 0.1190, 0.0636, 0.0556, 0.0632, 0.0921, 0.1320, 0.1465, 0.1748, 0.1418, 0.0993, 0.1195, 0.0927, 0.0733, 0.0743, 0.0894, 0.1084, 0.0956, 0.0652, 0.0415, 0.0340, 0.0481, 0.0678, 0.0623, 0.0597, 0.0585, 0.0597, 0.0679, 0.0382, 0.0225, 0.0124, 0.0159, 0.0364, 0.0588, 0.0547, 0.0225, 0.0022, 0.0025, 0.0015, 0.0019, 0.0017, 0.0014, 0.0019, 0.0047, 0.0117, 0.0201, 0.0234, 0.0043, 0.0013, 0.0200, 0.0539),
  one_yr_RiskFree_Annual_Spot_Rate = c(
    0.0352, 0.0400, 0.0439, 0.0458, 0.0610, 0.0562, 0.0628, 0.0793, 0.0804, 0.0529,
    0.0563, 0.0814, 0.0936, 0.0741, 0.0651, 0.0692, 0.0965, 0.1260, 0.1323, 0.1561,
    0.1419, 0.1047, 0.1267, 0.0960, 0.0689, 0.1508, 0.0904, 0.1005, 0.0931, 0.0667,
    0.0452, 0.0383, 0.0606, 0.0689, 0.0644, 0.0613, 0.0579, 0.0597, 0.0679, 0.0382,
    0.0223, 0.0136, 0.0219, 0.0410, 0.0585, 0.0491, 0.0213, 0.0059, 0.0041, 0.0024,
    0.0023, 0.0020, 0.0018, 0.0041, 0.0071, 0.0138, 0.0216, 0.0223, 0.0043, 0.0016,
    0.0210, 0.0700
  ),
  ten_yr_RiskFree_Annual_Spot_Rate = c(
    0.0449, 0.0475, 0.0479, 0.0475, 0.0579, 0.0579, 0.0623, 0.0739, 0.0855, 0.0670,
    0.0711, 0.0757, 0.0859, 0.0875, 0.0847, 0.0845, 0.0973, 0.1123, 0.1258, 0.1463,
    0.1503, 0.1218, 0.1443, 0.1201, 0.0828, 0.1700, 0.1033, 0.1000, 0.1005, 0.0890,
    0.0795, 0.0661, 0.0798, 0.0760, 0.0743, 0.0692, 0.0603, 0.0661, 0.0669, 0.0553,
    0.0507, 0.0448, 0.0485, 0.0483, 0.0569, 0.0503, 0.0423, 0.0381, 0.0364, 0.0311,
    0.0207, 0.0273, 0.0288, 0.0243, 0.0208, 0.0267, 0.0324, 0.0232, 0.0103, 0.0166,
    0.0290, 0.0312
  )
)



ts_data <- ts(data[, -1], start = 1962, end = 2023)

# Fit a time series model (ARIMA) for each interest rate
model_inflation <- auto.arima(ts_data[, "Inflation"])
model_overnight_rate <- auto.arima(ts_data[, "Government_Overnight_Rate"])
model_1yr_rate <- auto.arima(ts_data[, "one_yr_RiskFree_Annual_Spot_Rate"])
model_10yr_rate <- auto.arima(ts_data[, "ten_yr_RiskFree_Annual_Spot_Rate"])

# Forecast the next 5 years (adjust the h parameter accordingly)
forecast_inflation <- forecast(model_inflation, h = 5)
forecast_overnight_rate <- forecast(model_overnight_rate, h = 5)
forecast_1yr_rate <- forecast(model_1yr_rate, h = 5)
forecast_10yr_rate <- forecast(model_10yr_rate, h = 5)

# Print the forecasts
print("Inflation Forecast:")
print(forecast_inflation$mean)

print("Government Overnight Rate Forecast:")
print(forecast_overnight_rate$mean)

print("1-year Risk-Free Annual Spot Rate Forecast:")
print(forecast_1yr_rate$mean)

print("10-year Risk-Free Annual Spot Rate Forecast:")
print(forecast_10yr_rate$mean)


data$one_yr_RiskFree_Annual_Spot_Rate %>% diff() %>% ggtsdisplay(main="")

interest_rate <- data$one_yr_RiskFree_Annual_Spot_Rate

(fit1 <- Arima(data$one_yr_RiskFree_Annual_Spot_Rate, order=c(3,1,0)))
(fit2 <- Arima(data$one_yr_RiskFree_Annual_Spot_Rate, order=c(3,1,1)))
(fit3 <- Arima(interest_rate, order=c(4,1,0)))
(fit4 <- Arima(data$one_yr_RiskFree_Annual_Spot_Rate, order=c(2,1,0)))

checkresiduals(fit)

fit3$residuals %>% ggtsdisplay

autoplot(forecast(fit3))

values <- forecast(fit3,h =20)


autoplot(values) + ggtitle("Interest Rate Projection") +
  theme(plot.title = element_text(size = 20)) 

Interest_rate_CI <- summary(values)
Interest_rate_CI


?autoplot
