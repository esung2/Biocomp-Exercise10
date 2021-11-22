setwd("~/Desktop/r-novice-inflammation/Biocomp-Exercise10/")
list.files()

install.packages("ggplot2")
library(ggplot2)
install.packages("cowplot")
library(cowplot)

##Question 1
#Looking at relationship between hours spent studing and grades
#Loading text file:
hrsVSg <- read.table(file="HoursGrades.txt", header = TRUE, sep ="", stringsAsFactors = FALSE)

#Making scatterplot showing relationship between hours spent studying and grades
ggplot(data = hrsVSg, aes(x=HoursStudying, y = Grade)) +
  geom_point() +
  xlab("Time spent studying (hrs)") +
  ylab("Grade") +
  stat_smooth(method="lm") +
  theme_classic()

##Question 2

data <- read.table(file="data.txt", header = TRUE, sep=",", stringsAsFactors = FALSE)

#testing around
regions <- unique(data$region)
regions[1]
mean(data[data$region==regions[1],2])
length(data[data$region==regions[1],2])


#2 figures
#Figure 1: Bar plot, means of population in each region 
#need to calculate mean of each region 

ggplot(data, aes(x = region, y = observations)) +
  stat_summary(fun = mean, geom = "bar") +
  xlab("Region") +
  ylab("Mean") +
  theme_classic()

#correct loop - not needed
for (i in 1:length(regions)){
  print(mean(data[data$region==regions[i],2]))
}
#correct loop with results stored in a vector - not needed
for (i in 1:length(regions)){
  means <- c(results, mean(data[data$region==regions[i],2]))
}
means

ggplot(data=means, aes(x=regions)) +
  geom_bar()

#Figure 2: Scatter plot, all observations 
ggplot(data, aes(x=region, y = observations, color=region)) +
  geom_jitter() +
  xlab("Region") +
  ylab("Observations") +
  theme_classic()

##Do the bar and scatter plots tell you different stories? Why?
#
