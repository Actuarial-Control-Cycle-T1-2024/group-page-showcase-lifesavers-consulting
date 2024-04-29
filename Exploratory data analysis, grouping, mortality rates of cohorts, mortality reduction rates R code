install.packages("tidyverse")
install.packages("writexl")
library(tidyverse)
install.packages("patchwork")
install.packages("gridExtra")
library(dplyr)
library(writexl)
library(patchwork)
library(gridExtra)
rm(list = ls())

data <- read.csv("2024-srcsc-superlife-inforce-dataset.csv")


data_sev <- data %>%
  arrange(Year.of.Death)

##finding out how many deaths in each death year
death.data <- data_sev %>%
  filter(!is.na(Death.indicator) & Death.indicator == 1)

Summary_data <- death.data%>%
  group_by(Year.of.Death)%>%
  summarise(number_of_deaths = n(), total_face_amount = sum(Face.amount, na.rm=T))
print(Summary_data)
Summary_data
plot(Summary_data$Year.of.Death, Summary_data$total_face_amount)

#severity = total cost/claim count
severity <- Summary_data$total_face_amount/Summary_data$number_of_deaths
severity_table <- cbind(severity_each_year$Issue.year, severity)
severity_df <- as.data.frame(severity_table)
plot(severity_df,
     main = "severity of claims each year",
     xlab="year", ylab="severity",
     col="blue", pch=16)

ggplot(severity_df, aes(x = V1, y = severity)) +
  geom_point(color="blue", size = 3) +
  geom_smooth(method = "lm", se=F, color="red", linewidth=1.5) +
  labs(title = "severity of claims each year", x = "years", y="Severity")

#project the value 20 years
model <- lm(severity ~ V1, data=severity_df)
summary(model)
coefficients <- coef(model)
intercept <-coefficients[1]
slope <- coefficients[2]
cat("serverity=", round(intercept,3), "+", round(slope, 3), "*years")
num_years <- 21
future_years <- data.frame(V1 = seq(max(severity_df$V1)+1, max(severity_df$V1) + num_years, by=1))
projected_severity <- predict(model, newdata = future_years)

projection_data <- data.frame(V1 = future_years$V1, projected_severity)
tail(projection_data)


#combine into 1 data frame and graph
column_index <- which(names(projection_data) == "projected_severity")
names(projection_data)[column_index] <- "severity"
print(projection_data)
combined_severity <- rbind(severity_df, projection_data)

ggplot(combined_severity, aes(x = V1, y = severity)) +
  geom_point(color="blue", size = 3) +
  geom_smooth(method = "lm", se=F, color="red", linewidth=1.5) +
  labs(title = "severity of claims each year", x = "years", y="Severity")
#results:
# *claim severity in 2044 is 689938.8

#Assumption: the increase in severity follows a linear trend, thus the projected values of severity is also linear


#################age group###############################
data_sev$age.of.death <- data_sev$Year.of.Death - data_sev$Issue.year + data_sev$Issue.age
max(data_sev$age.of.death, na.rm = T)
age_groups <- cut(data_sev$age.of.death, breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 100), labels = c("0-10", "11-20", "21-30", "31-40", "41-50","51-60", "61-70", "71-80", "81-100"), right=F)
age_groups
data_AG <- data_sev
data_AG$age.groups <- age_groups
AGcount<-table(data_AG$age.groups)
AGcount
death.data2 <- data_AG %>%
  filter(!is.na(Death.indicator) & Death.indicator == 1)
length(data_AG$age.of.death)

data_AG$age.of.death[is.na(data_AG$age.of.death)] <- 2023 - data_AG$Issue.year[is.na(data_AG$age.of.death)] + data_AG$Issue.age[is.na(data_AG$age.of.death)]
age_groups2 <- cut(data_AG$age.of.death, breaks = c(0, 10, 20, 30, 40, 50, 60, 70, 80, 100), labels = c("0-10", "11-20", "21-30", "31-40", "41-50","51-60", "61-70", "71-80", "81-100"), right=F)
data_AG$age.groups <- age_groups2
data_AG$Death.indicator <- as.numeric(!is.na(data_AG$Death.indicator))
deaths <- subset(data_AG, Death.indicator==1)
result <- aggregate(cbind(deaths = Death.indicator, total_face_amount = Face.amount) ~ age.groups, data = deaths, sum)
result
result$severity <- result$total_face_amount/result$deaths

WLI <- data_AG %>%
  group_by(age.groups, Policy.type) %>%
  summarise(count = n(),
            average_face_amount = mean(Face.amount))
wholelife_result <- WLI %>%
  filter(Policy.type == "SPWL")
T20 <- data_AG %>%
  group_by(age.groups, Policy.type) %>%
  summarise(count = n(),
            average_face_amount = mean(Face.amount))
T20_result <- T20 %>%
  filter(Policy.type == "T20")

#plot
ggplot(result, aes(x = age.groups, y = severity)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  labs(title = "severity by Age Group",
       x = "Age Group",
       y = "severity")




###sample mortality of age groups###
countAG<- table(data_AG$age.groups)
countAG2 <- as.data.frame(countAG)
result$percentage <- result$deaths/countAG[result$age.groups]
result
ggplot(result, aes(x = age.groups, y = percentage, group = 1)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  labs(title = "sample mortality of each age group from 2001 to 2023",
       x = "Age Group",
       y = "mortality")
alive_20 <- sum(countAG2$Freq)
alive_30 <- sum(countAG2$Freq[countAG2$Freq!=10881])
alive_40 <- sum(countAG2$Freq[!(countAG2$Freq %in% c(10881, 114153))])
alive_50 <- sum(countAG2$Freq[!(countAG2$Freq %in% c(10881, 114153, 263657))])
alive_60 <- sum(countAG2$Freq[!(countAG2$Freq %in% c(10881, 114153, 263657, 311213))])
alive_70 <- sum(countAG2$Freq[!(countAG2$Freq %in% c(10881, 114153, 263657, 311213, 212337))])
alive_80 <- sum(countAG2$Freq[!(countAG2$Freq %in% c(10881, 114153, 263657, 311213, 212337, 61513))])
agegroups <- c("21-30", "31-40", "41-50","51-60", "61-70", "71-80", "81-100")
count <- c(alive_20,alive_30,alive_40,alive_50,alive_60,alive_70,alive_80)
countAG3 <- data.frame(agegroups = agegroups, count = count)
result$percentage2 <- result$deaths/countAG3$count

ggplot(result, aes(x = age.groups, y = percentage2, group = 1)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  labs(title = "probability of death of each age group",
       x = "Age Group",
       y = "mortality")

##smokers probs of death
smoking.by.age <- data_AG %>%
  group_by(age.groups) %>%
  summarize(CountSmokers = sum(Smoker.Status == "S"))
smoking.by.age
smokers_died_by_age <- data_AG %>%
  filter(Smoker.Status == "S" & Death.indicator == 1) %>%
  group_by(age.groups) %>%
  summarize(CountSmokersDied = n())
smokers_died_by_age
aliveS20 <- sum(smoking.by.age$CountSmokers)
aliveS30 <- sum(smoking.by.age$CountSmokers[!(smoking.by.age$CountSmokers %in% c(1407))])
aliveS40 <- sum(smoking.by.age$CountSmokers[!(smoking.by.age$CountSmokers %in% c(1407, 11172))])
aliveS50 <- sum(smoking.by.age$CountSmokers[!(smoking.by.age$CountSmokers %in% c(1407, 11172, 18575))])
aliveS60 <- sum(smoking.by.age$CountSmokers[!(smoking.by.age$CountSmokers %in% c(1407, 11172, 18575, 16503))])
aliveS70 <- sum(smoking.by.age$CountSmokers[!(smoking.by.age$CountSmokers %in% c(1407, 11172, 18575, 16503, 10444))])
aliveS80 <- sum(smoking.by.age$CountSmokers[!(smoking.by.age$CountSmokers %in% c(1407, 11172, 18575, 16503, 10444, 3281))])
smoker.alive <- c(aliveS20,aliveS30,aliveS40,aliveS50,aliveS60,aliveS70,aliveS80)
smoking.by.age$percentage <- smokers_died_by_age$CountSmokersDied/smoker.alive

ggplot(smoking.by.age, aes(x = age.groups, y = percentage, group = 1)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  labs(title = "probability of death of smokers of each age group",
       x = "Age Group",
       y = "mortality")
S.plot <- ggplot(smoking.by.age, aes(x = age.groups, y = percentage, group = 1)) +
  geom_bar(stat = "identity", fill = "skyblue", position = "dodge") +
  labs(title = "probability of death of smokers of each age group",
       x = "Age Group",
       y = "mortality") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

##Non-smokers probs of death
NS.by.age <- data_AG %>%
  group_by(age.groups) %>%
  summarize(CountSmokers = sum(Smoker.Status == "NS"))
NS.deaths <- data_AG %>%
  filter(Smoker.Status == "NS" & Death.indicator == 1) %>%
  group_by(age.groups) %>%
  summarize(CountSmokersDied = n())
NS.deaths
NS.by.age
aliveNS20 <- sum(NS.by.age$CountSmokers)
aliveNS30 <- sum(NS.by.age$CountSmokers[!(NS.by.age$CountSmokers %in% c(9474))])
aliveNS40 <- sum(NS.by.age$CountSmokers[!(NS.by.age$CountSmokers %in% c(9474, 102981))])
aliveNS50 <- sum(NS.by.age$CountSmokers[!(NS.by.age$CountSmokers %in% c(9474, 102981, 245082))])
aliveNS60 <- sum(NS.by.age$CountSmokers[!(NS.by.age$CountSmokers %in% c(9474, 102981, 245082, 294710))])
aliveNS70 <- sum(NS.by.age$CountSmokers[!(NS.by.age$CountSmokers %in% c(9474, 102981, 245082, 294710, 201893))])
aliveNS80 <- sum(NS.by.age$CountSmokers[!(NS.by.age$CountSmokers %in% c(9474, 102981, 245082, 294710, 201893, 58232))])
NS.alive <- c(aliveNS20,aliveNS30,aliveNS40,aliveNS50,aliveNS60,aliveNS70,aliveNS80)
NS.by.age$probs <- NS.deaths$CountSmokersDied/NS.alive

ggplot(NS.by.age, aes(x = age.groups, y = probs, group = 1)) +
  geom_line(color = "blue") +
  geom_point(color = "red") +
  labs(title = "probability of death of non-smokers of each age group",
       x = "Age Group",
       y = "mortality")
NS.plot <- ggplot(NS.by.age, aes(x = age.groups, y = probs, group = 1)) +
  geom_bar(stat = "identity", fill = "skyblue", position = "dodge") +
  labs(title = "probability of death of non-smokers of each age group",
       x = "Age Group",
       y = "mortality") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))

combined.probs.plot <- S.plot + NS.plot
combined.probs.plot

###age group breakdown
count_v <- c(countAG2$Freq[3], countAG2$Freq[4],countAG2$Freq[5],countAG2$Freq[6],countAG2$Freq[7],countAG2$Freq[8],countAG2$Freq[9])
countAG4 <- data.frame(agegroups = agegroups, count = count_v)


#projection of new policyholder entries for the next 20 years
count_policies <- as.data.frame(count_policies)
ggplot(count_policies, aes(x = factor(Var1), y = Freq)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  geom_smooth(method = "lm", formula = y~x, se = FALSE, color = "red") +
  labs(title = "Number of Entries in Each Year",
       x = "Issue Year",
       y = "Number of Entries") +
  theme_minimal()

ggplot(count_policies, aes(x = Var1, y = Freq)) +
  geom_point(color = "blue") +
  geom_smooth(method = "lm", se = FALSE, color = "red") +
  labs(title = "Number of Entries in Each Year with Trend Line",
       x = "Issue Year",
       y = "Number of Entries") +
  theme_minimal()

count_policies$Var1 <- as.numeric(count_policies$Var1)
fit <- lm(Freq ~ as.numeric(Var1), data = count_policies)
plot(count_policies$Freq ~ count_policies$Var1, 
     data=count_policies, col = "blue", pch =16,
     main = "Number of insured each issue year", xlab = "Issue Year", ylab = "Number of Entries")
abline(fit, col="red")

future_years <- seq(max(count_policies$Var1) + 1, max(count_policies$Var1) + 20, by = 1)
future_years <- as.data.frame(future_years)
predicted_values <- predict(fit, newdata = data.frame(Var1 = future_years))
predicted_values <-as.data.frame(predicted_values)
projection44 <- cbind(future_years,predicted_values)
lines(future_years, predicted_values, col = "green", lty = 2)
plot(projection44)
projection44$future_years <- projection44$future_years + 2000
projection44$predicted_number_of_insured <- projection44$predicted_values
projection44 <- subset(projection44, select = -predicted_values)
write_xlsx(projection44, path = "projected.no.insured.xlsx")

max(data_AG$age.of.death)
sum(count_policies$Freq)


#############################payout after intervention###################################

### mortality reduction based on transition matrix probabilities
short_reduction <- as.data.frame(reduction)
M.reduction <- short_reduction
M.reduction$reduction[16:50] <- long.term.reduction2
short_reduction$factor <- 1 - short_reduction$reduction
M.reduction$factor <- 1 - M.reduction$reduction
S.reduction <- short_reduction
S.reduction$reduction[16:50] <- long.term.reduction.smoker
Sensitivity.M <- short_reduction
Sensitivity.M$reduction[16:50] <- sensitivty.reduction

sensitivty.reduction <- 0.06451505*(1-0.05)^3 + 0.1935475*(1-0.03)^3 + 0.2419375*(1-0.02)^3 + 0.5*(1-0.0)^3
sensitivty.reduction2 <- 0.06451505*(1 - 0.075)^2*(1-0.09) + 0.1935475*(1-0.05)^3 + 0.04193745*(1-0.03)^3 + 0.7*(1-0.0)^3
sensitivty.reduction2S <- 0.06451505*(1 - 0.09)^2*(1-0.075) + 0.1935475*(1-0.05)^2*(1-0.06) + 0.04193745*(1-0.03)^2*(1-0.04) + 0.7*(1-0.0)^3
###long-term mortality reduction (values can be changed)
Long.term.reduction <- 1 - (0.4*0.075 + 0.2*0.05 + 0.2*0.03  + 0.2*0)
long.term.reduction2 <- 0.06451505*(1 - 0.075)^2*(1-0.09) + 0.1935475*(1-0.05)^3 + 0.3225809*(1-0.03)^3 + 0.4193565*(1-0.0)^3
long.term.reduction.smoker <- 0.06451505*(1 - 0.09)^2*(1-0.075) + 0.1935475*(1-0.05)^2*(1-0.06) + 0.3225809*(1-0.03)^2*(1-0.04) + 0.4193565*(1-0.0)^3
vector <- 1:20

vector[2]
###smokers decreased
#Assumption: linear rate of decrease for simplicity 
#data limitation: Decreasing rate of smokers is not provided so we used smoking cessation studies and other oindependent studies as a reference
#https://www.cdc.gov/tobacco/data_statistics/fact_sheets/cessation/smoking-cessation-fast-facts/index.html
#7.5% quit in 2018
#assume a linear rate of decrease of 1% as a conservative estimate (choose between 1% and 7.5% for scenario testing)
smoking.decrease <- 0.01



