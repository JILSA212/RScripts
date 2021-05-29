rm(list=ls())

data("iris")
df <- as.data.frame(iris[,1:4])
df

model <- kmeans(df, centers=3, nstart=20)
model$centers
model$betweenss
model$size

wssplot <- function(data, nc=15, seed=123) {
  wss <- (nrow(data)-1*sum(apply(data,2,var)))
  for(i in 2:nc) {
    set.seed(seed)
    wss[i] <- sum(kmeans(data, centers=i)$withinss)
  }
  
  plot(1:nc, wss, type="b", xlab="Number of Groups", ylab="Sum of squares within a group")
}

wssplot(df, nc=20)

library("cluster")
library("factoextra")

sil <- silhouette(model$cluster, dist(df))
fviz_silhouette(sil)