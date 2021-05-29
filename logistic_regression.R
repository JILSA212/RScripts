rm(list=ls())
library("Amelia")
library("tidyverse")
library("ISLR")

#Loading the data
data("iris")
iris

#Changing it to Binary Classification
df = iris
class(df)

df$Setosa <- df$Species=="setosa"
df
summary(df)

ggplot(data=df, aes(x=Sepal.Length, y=Setosa)) + geom_point()
missmap(df, col=c("blue","red"), legend=FALSE)

library("corrplot")
correlations <- cor(df[,1:4])
corrplot(correlations, method = "circle")

pairs(df, col="chartreuse")


library("caret")
x <- matrix(df$Sepal.Length)
y <- factor(df$Setosa)
featurePlot(x=x, y=y, plot="Box")
# featurePlot(x=x, y=y, plot="ellipse")
featurePlot(x=x, y=y, plot="strip")
featurePlot(x=x, y=y, plot="Density")

model <- glm(Setosa ~ Sepal.Length, data=df, family=binomial)
summary(model)

result <- predict(model, type="response")
result

ans <- ifelse(result<0.33, FALSE, TRUE)
ans

accuracy <- sum(ans==df$Setosa)
accuracy/length(df$Setosa)