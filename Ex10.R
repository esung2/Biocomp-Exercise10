setwd("~/Desktop/r-novice-inflammation/Biocomp-Exercise10/")
list.files()

install.packages("ggplot2")
library(ggplot2)
install.packages("cowplot")
library(cowplot)

#Question 1
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
