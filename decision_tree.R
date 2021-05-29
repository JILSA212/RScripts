rm(list=ls())

library("ISLR")
library("tree")

data(package="ISLR")
df <- as.data.frame(Carseats)

names(df)
hist(df$Sales)
df$target <- as.factor(ifelse(df$Sales<=8,"No","Yes"))
names(df)


model <- tree(target~.-Sales,data=df)
summary(model)

plot(model)
text(model, pretty=0)

model

set.seed(101)
train = sample(1:nrow(df), 250)
new_df = df[train,]

model2 <- tree(target~.-Sales, data = new_df)
summary(model2)

plot(model2)
text(model2, pretty=0)

predictions <- predict(model2, df[-train,], type="class")
with(df[-train,], table(predictions, target))
print((74+39)/150)

crossValidate = cv.tree(model2, FUN=prune.misclass)
crossValidate
plot(crossValidate)

pruneTree = prune.misclass(model2, best=12)
plot(pruneTree)
text(pruneTree, pretty=0)

prunePrediction = predict(pruneTree, df[-train,], type="class")
with(df[-train,], table(prunePrediction, target))
print((72+38)/150)