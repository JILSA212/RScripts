rm(list=ls())

library("tidyverse")
library("e1071")

data("CO2")

df = CO2
X = df[,c(1,3:5)]
Y = df$Type

plot(df)
plot(X[1],Y, col="blue")
plot(X$conc,Y)
points(X$conc, Y)
lines(X$conc, Y)


new_df = data.frame(X, y=as.factor(Y))
model = svm(y ~ ., data=new_df, kernel="linear",scale=FALSE)
summary(model)

plot(model, new_df, conc~uptake)

ans = predict(model, new_df[,1:4])
accuracy = sum(ans == new_df$y)
accuracy