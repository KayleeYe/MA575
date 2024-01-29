#Bike Share

#access the csv file from my computer
#I usually do file_path then use read.csv(file_path) and assign it a variable called facebookdata here
#to access the data
#customn the file_path (where your computer stores the file at on your computer) to access the corresponding csv file
#to access the data successfully

#notice when you "copy the file address" of the csv file you need by clicking right of your mouse,
#the file path has '\' but you need to change the slash to right '/' so R can read it successfully 
file_path = "D:/copied from desktop/Elsa BUBUBU/大三下/ma575/project/day.csv"

mydata <- read.csv(file_path,header=T)#facebook dataset has header, so header=T
head(bikedata)#head() function accesses the first few rows of the data

#in R you use "$" to access each variable of the dataset

#Recall from the data description: From a business point of view, it is of 
#interest to be able to accurately predict the level at which bike resources are likely 
#to be used on any given day. That is, at a minimum it is of interest to predict 
#the numbers of bike rentals in an area on a daily (or even hourly) basis.

season = mydata$season
yr = mydata$yr
month = mydata$mnth
holiday = mydata$holiday
wkday = mydata$weekday
workinday = mydata$workingday
weather = mydata$weathersit
temp = mydata$temp
hum = mydata$hum
wind = mydata$windspeed
casual = mydata$casual
reg = mydata$registered
cnt = mydata$cnt
hist(cnt)
boxplot(cnt)
