setwd("/Users/mbr/Desktop/hubway-clustering/")

library(caTools)
library(caret)

data <- read.csv("hubwaytrips.csv")

# Analysis only conducted on 5% of data
set.seed(0711)
data$split <- sample.split(data$Male, SplitRatio = 0.05)

mydata <- subset(data, data$split == TRUE)
rownames(mydata) <- seq(length=nrow(mydata))
mydata <- mydata[,-10]

### Data Visualization ###

vis.data <- mydata

# Create column to show time of day instead of a binary flag
vis.data$Period
for(i in 1:nrow(vis.data)){
  if(vis.data[i, "Morning"] == 1){
    vis.data[i, "Period"] <- "Morning"
  } else if(vis.data[i, "Afternoon"] == 1){
    vis.data[i, "Period"] <- "Afternoon"
  } else if(vis.data[i, "Evening"] == 1){
    vis.data[i, "Period"] <- "Evening"
  } else {
    vis.data[i, "Period"] <- "Night"
  }
}

# Create column to show weekday or weekend instead of a binary flag
vis.data$WeekdayWeekend
for(i in 1:nrow(vis.data)){
  if(vis.data[i, "Weekday"] == 1){
    vis.data[i, "WeekdayWeekend"] <- "Weekday"
  } else {
    vis.data[i, "WeekdayWeekend"] <- "Weekend"
  }
}

# Create column to show gender instead of a binary flag
vis.data$Gender
for(i in 1:nrow(vis.data)){
  if(vis.data[i, "Male"] == 1){
    vis.data[i, "Gender"] <- "Male"
  } else {
    vis.data[i, "Gender"] <- "Female"
  }
}

# Remove all columns showing flags 
vis.data <- subset(vis.data, select = -c(Morning, Afternoon, Evening, Night, Weekday, Weekend, Male))

# Histogram of trips during different periods of day per Gender
ggplot(data=vis.data, aes(x=Gender, fill=Period)) + geom_bar(stat="count", position="dodge")+
  labs(title="Histogram of Trips During Different Periods per Gender ", x ="Gender", y = "Occurences")+ 
  theme(plot.title = element_text(hjust = 0.5))

# Histogram of trips during different periods of day per weekday or weekend
ggplot(data=vis.data, aes(x=WeekdayWeekend, fill=Period)) + geom_bar(stat="count", position="dodge")+
  labs(title="Histogram of Trips Weekday and Weekend split by Period", x ="Weekday or Weekend", y = "Occurences")+ 
  theme(plot.title = element_text(hjust = 0.5))

# Boxplot of age based on period of the day of trips
boxplot(vis.data$Age~vis.data$Period, main="Boxplot of Age Based on Period of the Day of Trips", 
        xlab="Period", ylab="Age", outline = FALSE)

# Age distribution
ggplot(vis.data,aes(Age))+geom_bar(fill="grey",colour="black", stat="count")+
  labs(title="Age Distribution", x ="Age", y = "Occurences")+ 
  theme(plot.title = element_text(hjust = 0.5))
