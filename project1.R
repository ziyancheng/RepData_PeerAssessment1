#Loading and preprocessing the data

library(dplyr)
library(ggplot2)
setwd("/Users/chengya@us.ibm.com/coursera/reproducibleResearch/week2")
colus <- c("integer", "character", "integer")
df <- read.csv("activity.csv", header = TRUE, colClasses = colus, na.strings = "NA")

#Calculate the total number of steps taken per day

total_steps <- with(df, aggregate(df$steps, by=list(df$date), FUN=sum, na.rm=TRUE))
names(total_steps) <- c("date", "steps")
#df$date <- as.Date(df$date)
#cleanSet <- subset(df, !is.na(df$steps))
#total_steps <- tapply(cleanSet$steps, cleanSet$date, sum, na.rm=TRUE, simplify = TRUE)
#total_steps <- total_steps[!is.na(total_steps)]
#names(total_steps) <- c("date", "steps")
#hist(total_steps$steps, main="the total number of steps taken per day", col="blue", ylim = c(0,20))

#hist(total_steps$steps, main = "Total number of steps taken per day", xlab = "Total steps taken per day", col = "darkblue", ylim = c(0,20))
mean(total_steps$steps)
median(total_steps$steps)

hist(x=total_steps$steps,
     col="green",
     xlab = "The daily total of steps",
     ylab = c(0,20),
     breaks=20,
     main="The distribution of total Steps (ignored the missing data)")

