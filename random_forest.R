rm(list=ls())

library("MASS")
library("randomForest")

data(package="MASS")
df <- Boston

dim(df)
names(df)

set.seed(101)
train = sample(1:nrow(df), 300)
new_df = df[train,]

model = randomForest(medv~., data=new_df)
model

oobError = double(13)
testError = double(13)

for(mtry in 1:13) {
  fit = randomForest(medv~., data=new_df, mtry=mtry, ntree=350)
  oobError[mtry] = fit$mse[350]
  pred = predict(fit, df[-train,])
  testError[mtry] = with(df[-train,], mean((medv-pred)^2))
}

matplot(1:mtry, cbind(testError, oobError), pch=23, col=c("red","blue"), type="b", ylab="Mean Squared Error")
legend("topright", legend=c("OOB", "Test"), pch=23, col=c("red","blue"))

# Boosting
library("gbm")

boost = gbm(medv~., data=new_df, distribution = "gaussian", n.trees = 10000, shrinkage = 0.01, interaction.depth = 4)
summary(boost)

plot(boost, i="lstat")
plot(boost, i="rm")

n.trees = seq(from=100, to=10000, by=100)
prediction = predict(boost, newdata = df[-train,], n.trees = n.trees)
dim(prediction)

boostError = with(df[-train,], apply((prediction-medv)^2, 2, mean))
plot(n.trees, boostError, pch=23, ylab="Mean Squared Error", xlab="# Trees", main="Boosting Test Error")
abline(h=min(testError), col="red")
