setwd("~/Desktop/r-novice-inflammation/Biocomp-Exercise10/")

install.packages("ggplot2")
library(ggplot2)
install.packages("cowplot")
library(cowplot)

##Question 1
#Looking at the relationship between hours spent studying and grades
#Loading text file:
hrsVSg <- read.table(file="HoursGrades.txt", header = TRUE, sep ="", stringsAsFactors = FALSE)
hrsVSg

#Making scatterplot showing the relationship between hours spent studying and grades
ggplot(data = hrsVSg, aes(x=HoursStudying, y = Grade)) +
  geom_point() +
  xlab("Time spent studying (hours)") +
  ylab("Grade") +
  stat_smooth(method="lm") +
  theme_classic()

##Question 2
#Loading the data 
data <- read.table(file="data.txt", header = TRUE, sep=",", stringsAsFactors = FALSE)

#Figure 1: Bar plot, means of observation in each region 
ggplot(data, aes(x = region, y = observations)) +
  stat_summary(fun = mean, geom = "bar") +
  xlab("Region") +
  ylab("Mean") +
  theme_classic()

#Figure 2: Scatter plot, all observations 
ggplot(data, aes(x=region, y = observations, color=region)) +
  geom_jitter() +
  xlab("Region") +
  ylab("Observations") +
  theme_classic()

##Do the bar and scatter plots tell you different stories? Why?
# Scatter plot shows the distribution of the points. bar plot does not show the distribution so you cannot see what exactly is affecting the mean
