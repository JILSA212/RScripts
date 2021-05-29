#Importing libraries
library(tidyverse)
library(ggpubr)

# Loading dataset
data(Orange)

X = Orange$age
Y = Orange$circumference

head(X,4)
ggplot(Orange, aes(x=age, y=circumference)) + geom_point() + stat_smooth()

cor(X,Y)

model <- lm(age ~ circumference, data=Orange)
model

ggplot(Orange, aes(x=age, y=circumference)) + geom_point() + stat_smooth(method = lm)

summary(model)
confint(model)
RSE <- sigma(model)*100/mean(Orange$age)
RSE