#Bike Share

#access the csv file from my computer
#I usually do file_path then use read.csv(file_path) and assign it a variable called facebookdata here
#to access the data
#customn the file_path (where your computer stores the file at on your computer) to access the corresponding csv file
#to access the data successfully
#notice when you "copy the file address" of the csv file you need by clicking right of your mouse,
#the file path has '\' but you need to change the slash to right '/' so R can read it successfully 

file_path = "D:/copied from desktop/Elsa BUBUBU/大三下/ma575/project/lab2/day.csv"

mydata <- read.csv(file_path,header=T)#facebook dataset has header, so header=T
head(mydata)#head() function accesses the first few rows of the data

#in R you use "$" to access each variable of the dataset

#Recall from the data description: From a business point of view, it is of 
#interest to be able to accurately predict the level at which bike resources are likely 
#to be used on any given day. That is, at a minimum it is of interest to predict 
#the numbers of bike rentals in an area on a daily (or even hourly) basis.

season = mydata$season #season: (1:winter, 2:spring, 3:summer, 4:fall)
yr = mydata$yr #year: year (0: 2011, 1:2012)
month = mydata$mnth #month ( 1 to 12)
holiday = mydata$holiday #weather day is holiday or not (extracted from http://dchr.dc.gov/page/holiday-schedule)
wkday = mydata$weekday #day of the week
workinday = mydata$workingday #if day is neither weekend nor holiday is 1, otherwise is 0.
weather = mydata$weathersit
#1: Clear, Few clouds, Partly cloudy, Partly cloudy
#2: Mist + Cloudy, Mist + Broken clouds, Mist + Few clouds, Mist
#3: Light Snow, Light Rain + Thunderstorm + Scattered clouds, Light Rain + Scattered clouds
#4: Heavy Rain + Ice Pallets + Thunderstorm + Mist, Snow + Fog
temp = mydata$temp
#Normalized temperature in Celsius. The values are derived via (t-t_min)/(t_max-t_min), 
#t_min=-8, t_max=+39 (only in hourly scale)
atemp = mydata$atemp
#Normalized feeling temperature in Celsius. The values are derived via (t-t_min)/(t_max-t_min), 
#t_min=-16, t_max=+50 (only in hourly scale)
hum = mydata$hum #Normalized humidity. The values are divided to 100 (max)
wind = mydata$windspeed # Normalized wind speed. The values are divided to 67 (max)
casual = mydata$casual #count of casual users
reg = mydata$registered #count of registered users
cnt = mydata$cnt #the total rental bikes including both casual and registered

summary(cnt)
#min = 22, 1st_q = 3152, median = 4548, mean = 4504, 3rd_q = 5956, max = 8714
hist(cnt) 
summary(reg)
#min = 20, 1st_q = 2497, median = 3662, mean = 3656, 3rd_q = 4776, max = 6946 
hist(reg)
summary(casual)
#min = 2.0, 1st_q = 315.5, median = 713.0, mean = 848.2, 3rd_q = 1096.0, max = 3410.0 
hist(casual)
#seems that overall, the average of registered users are greater than casual bike users

#plot trial to see data
plot(weather,cnt)
plot(weather,reg)
plot(weather,casual)


plot(hum,cnt)
plot(temp,cnt)
plot(temp,casual)
plot(temp,reg)

#plot(workinday,cnt)
plot(season,cnt)
plot(holiday,cnt)
plot(holiday,casual)

#further codes
#----descriptive data----
#count
hist(count)
#holiday
holiday_n <- sum(holiday==1) #21
hist(holiday,breaks=c(0,0.5,1),xlim=c(0, 1))
#the day of the week (numbered 0=Sunday to 6=Saturday)
hist(wkday)
sunday <- sum(wkday==0) #105
sunday
monday <- sum(wkday==1) #105
monday
tues <- sum(wkday==2) #105
tues #104
weds <- sum(wkday==3)
weds #104
thurs <- sum(wkday==3)
thurs #104
fri <- sum(wkday==3)
fri #104
sat <- sum(wkday==3)
sat #104
#weather (categorical, 1-4 with a higher number indicating worse weather)
hist(weather)
one <- sum(weather==1)
one #463
two <- sum(weather==2)
two #247
three <- sum(weather==3)
three #21
#windspeed (continuous)
hist(wind)
summary(wind)
#temperature (Celsius, continuous)
hist(temp)
summary(temp)
#feeling temperature (Celsius, continuous)
hist(atemp)
summary(atemp)
#humidity (continuous)
hist(hum)
summary(hum)

#visuals
# 1. holiday on count of bikes rented
# 2. the day of the week on count of bikes rented 
# 3. weather (1-4) on count of bikes rented 
library(readxl)
library(car)
library (ggplot2)
library(GGally)
scatterplot(holiday,cnt,xlab="Holiday",ylab="Cnt")
model1 <- lm(cnt~holiday)
summary(model1)
scatterplot(wkday,cnt,xlab="Day of the Week",ylab="Cnt")
model2 <- lm(cnt~wkday)
summary(model2)
scatterplot(weather,cnt,xlab="Weather",ylab="Cnt")
model3 <- lm(cnt~weather)
summary(model3)