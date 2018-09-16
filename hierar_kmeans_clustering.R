setwd("/Users/mbr/Desktop/hubway-clustering/")

library(caTools)
library(caret)

data <- read.csv("hubwaytrips.csv")

# Analysis only conducted on 5% of data
set.seed(0711)
data$split <- sample.split(data$Male, SplitRatio = 0.05)

mydata <- subset(data, data$split == TRUE)
rownames(mydata) <- seq(length=nrow(mydata))
mydata <- mydata[,-10]

### Cluster Analysis ###

# Data Normalization 

preproc <- preProcess(mydata)
normData <- predict(preproc, mydata)

#### HIERARCHICAL CLUSTERING ####

distances1 <- dist(normData, method="euclidean")

set.seed(0711)
Hclusters1 <- hclust(distances1, method="ward.D")
plot(Hclusters1, main = "Cluster Dendrogram - ward.D Method")
set.seed(0711)
Hclusters2 <- hclust(distances1, method="centroid")
plot(Hclusters2, main = "Cluster Dendrogram - Centroid Method")
set.seed(0711)
Hclusters3 <- hclust(distances1, method="average")
plot(Hclusters3, main = "Cluster Dendrogram - Average Method")
set.seed(0711)
Hclusters4 <- hclust(distances1, method="single")
plot(Hclusters4, main = "Cluster Dendrogram - Single Method")
set.seed(0711)
Hclusters5 <- hclust(distances1, method="complete")
plot(Hclusters5, main = "Cluster Dendrogram - Complete Method")
set.seed(0711)
Hclusters6 <- hclust(distances1, method="median")
plot(Hclusters6, main = "Cluster Dendrogram - Median Method")

rect.hclust(Hclusters1,k=5,border="red")

clusterCut1 <- cutree(Hclusters1, 6)
table(clusterCut1)

hclust_sum <- table(mydata$Male,clusterCut1)
hclust_sum
tapply(mydata$Duration, clusterCut1, mean)
tapply(mydata$Morning, clusterCut1, mean)
tapply(mydata$Afternoon, clusterCut1, mean)
tapply(mydata$Evening, clusterCut1, mean)
tapply(mydata$Night, clusterCut1, mean)
tapply(mydata$Weekday, clusterCut1, mean)
tapply(mydata$Weekend, clusterCut1, mean)
tapply(mydata$Male, clusterCut1, mean)
tapply(mydata$Age, clusterCut1, mean)

#### KMEANS CLUSTERING ####

# KMeans with 10 clusters
library(cluster)
set.seed(0711)
KmeansClustering <- kmeans(normData, centers=10,nstart=25)
table(KmeansClustering$cluster)

tapply(mydata$Duration, KmeansClustering$cluster, mean)
tapply(mydata$Morning, KmeansClustering$cluster, mean)
tapply(mydata$Afternoon, KmeansClustering$cluster, mean)
tapply(mydata$Evening, KmeansClustering$cluster, mean)
tapply(mydata$Night, KmeansClustering$cluster, mean)
tapply(mydata$Weekday, KmeansClustering$cluster, mean)
tapply(mydata$Weekend, KmeansClustering$cluster, mean)
tapply(mydata$Male, KmeansClustering$cluster, mean)
tapply(mydata$Age, KmeansClustering$cluster, mean)

# Elbow Curve
# Source: https://www.r-bloggers.com/finding-optimal-number-of-clusters/
wss <- sapply(1:40, function(k){kmeans(normData, k, nstart=25,iter.max = 40 )$tot.withinss})
plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE, main = "Plot of # Clusters vs. tot.withinss", 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

# KMeans with 6 clusters
library(cluster)
set.seed(0711)
KmeansClustering <- kmeans(normData, centers=6,nstart=25)
table(KmeansClustering$cluster)

tapply(mydata$Duration, KmeansClustering$cluster, mean)
tapply(mydata$Morning, KmeansClustering$cluster, mean)
tapply(mydata$Afternoon, KmeansClustering$cluster, mean)
tapply(mydata$Evening, KmeansClustering$cluster, mean)
tapply(mydata$Night, KmeansClustering$cluster, mean)
tapply(mydata$Weekday, KmeansClustering$cluster, mean)
tapply(mydata$Weekend, KmeansClustering$cluster, mean)
tapply(mydata$Male, KmeansClustering$cluster, mean)
tapply(mydata$Age, KmeansClustering$cluster, mean)
