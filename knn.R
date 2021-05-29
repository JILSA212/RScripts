rm(list=ls())

data("iris")
df <- iris

sam <- sample(1:nrow(df),0.9*ncol(df))

nor <- function(x) {
  ((x-min(x))/(max(x)-min(x)))
}

normal_df <- as.data.frame(lapply(df[,1:4],nor))
summary(normal_df)

train_x <- normal_df[sam,]
test_x <- normal_df[-sam,]
train_y <- df[sam,5]
test_y <- df[-sam,5]

library("class")

model <- knn(train_x, test_x, cl=train_y, k=10)
tab <- table(model, test_y)

accuracy <- function(x) {
  sum(diag(x)/sum(rowSums(x)))*100
}

accuracy(tab)
x = c()

for(i in 1:13)
{
  temp_model <- knn(train_x, test_x, cl=train_y, k=i)
  temp_tab <- table(temp_model, test_y)
  x <- append(x, accuracy(temp_tab))
}

col1 <- seq(1:13)
col2 <- x
plot_df <- as.data.frame(cbind(col1,col2))

library("tidyverse")
ggplot(data=plot_df, aes(x=col1, y=col2)) + geom_path()