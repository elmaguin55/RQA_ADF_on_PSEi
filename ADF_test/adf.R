#uncomment to install necessary packages
#install.packages("tseries")
#install.packages("crqa")
#install.packages("rlang")
#install.packages("readr")

#Load packages
library(tseries)
library(crqa)
library(rlang)
library(readr)

data <- read.csv("stocks", header=FALSE, stringsAsFactors = FALSE)
price_ts <- ts(data)
print(data)



adf_result <- adf.test(price_ts)
# Extract values safely
test_stat <- as.numeric(adf_result$statistic)
p_value <- adf_result$p.value
lag_order <- as.numeric(adf_result$parameter)
 
# Decision rule
decision <- ifelse(p_value > 0.05, "Non-stationary", "Stationary")
# Create APA 7 style table (base R, no extra packages needed)
apa_table <- data.frame(Test = "Augmented Dickey-Fuller",Statistic = round(test_stat, 6), Lag_Order = lag_order,
p_value = round(p_value, 6),Decision = decision)

# Display table
apa_table
print(kpss.test(price_ts, null = "Trend"))
pp.test(price_ts, type = "Z(t_alpha)")

