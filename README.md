# hubway-clustering
Market segmentation for Hubway (Boston's Bike Sharing Program) using hierarchical and kmeans clustering.

Table of Contents
-----------------

- [Initial Data Visualization](#initial-data-visualization)
- [Cluster Analysis](#cluster-analysis)
  - [Data Normalization](#data-normalization)
  - [Hierarchical Clustering](#hierarchical-clustering)
  - [Determining Number of Clusters Using Hierarchical Clustering](#determining-number-of-clusters-using-hierarchical-clustering)
  - [Analyzing the Clusters in Hierarchical Clustering](#analyzing-the-clusters-in-hierarchical-clustering)
  - [Analyzing the Clusters in KMeans Clustering](#analyzing-the-clusters-in-kmeans-clustering)
  - [Determining Right Number of Clusters In KMeans](#determining-right-number-of-clusters-in-kmeans)
  - [Comparing Hierarchical and KMeans Clustering](#comparing-hierarchical-and-kmeans-clustering)
  - [Recommendations for Hubway](#recommendations-for-hubway)

## Initial Data Visualization
![Figure 1](https://github.com/gaganchane/hubway-clustering/blob/master/images/Figure1.png)

It is evident that most of the trips are taken by males. In fact, it seems male trips have more than two times more occurrences than female trips. However, the trend of trip occurrences during different times of the day is consistent for both genders with the most trips occurring in the afternoon, followed by morning, evening, and then night.

![Figure 2](https://github.com/gaganchane/hubway-clustering/blob/master/images/Figure2.png)

More than two thirds of the trips are taken during a weekday. In addition, the highest occurring trips were during the afternoon during weekdays and the weekend.

![Figure 3](https://github.com/gaganchane/hubway-clustering/blob/master/images/Figure3.png)

Most of the riders in the afternoon are aged between 28 to 45 and the median age being approximately 33. During the evening, most of the trips have riders aged around 28 to 36 with the median age being around 30. The morning is similar to afternoon with the median age being around 34. The most common age of riders that take trips during the night is 27 to 33 with the median age being around 28.

![Figure 4](https://github.com/gaganchane/hubway-clustering/blob/master/images/Figure4.png)

The age range for the highest occurrences of trips are from users aged between 23-35. This shows that most of the trips are taken by young individuals.

## Cluster Analysis

### Data Normalization

It is important to normalize the data because clustering is sensitive to magnitude, and since the units of all variables are not the same, some variables may get more influence than they should. If the variables in the Hubway dataset are not normalized, duration and age would be the most influential variables when Euclidean or any other distance metric is used to measure the distance between data points since the magnitudes are much higher than the remaining variables which are binary.


## Hierarchical Clustering

![Figure 5](https://github.com/gaganchane/hubway-clustering/blob/master/images/Figure5.png)

In the dendrogram above, the ward.D method was used for cluster distances and it can be seen that there are visible distinct clusters at different heights along the dendrogram. In the dendrogram below, the centroid method was used, and it can be seen that no visible clusters can be distinguished. Also, cluster lines seem to be overlapping meaning that centroid distance is not an ideal method to use.

![Figure 6](https://github.com/gaganchane/hubway-clustering/blob/master/images/Figure6.png)


Thirdly, the single linkage method was used for cluster distances and it is evident that no distinct clusters are visible. This can be seen in the dendrogram below. There is also overlapping between different cluster lines. Therefore, ward.D is that best method to calculate the cluster distances.

![Figure 7](https://github.com/gaganchane/hubway-clustering/blob/master/images/Figure7.png)

## Determining Number of Clusters Using Hierarchical Clustering

![Figure 8](https://github.com/gaganchane/hubway-clustering/blob/master/images/Figure8.png)

Based on the dendrogram, five or six number of clusters is a reasonable choice. The figure above shows a red lining portraying 5 clusters. By selecting five clusters, the clusters will still be distinct, but not too distinct where we are overfitting the data into clusters. For the leftmost three clusters in the dendrogram, it can be seen that the vertical line where the cut was made is far more longer than the vertical lines below the cut. This shows that by selecting five clusters, we are also not generalizing the data too much by creating too few clusters. Six would also be a reasonable choice for the number of clusters since the left most current cluster in the dendrogram could be split into two clusters since the distance (represented by the line/height) between the two to combine them into one cluster is high (approximately 2000).

In terms of the application, since this data is being used for market segmentation, it depends on how specific the company would like to segment since this will increase the number of clusters. It’s not desirable to create too many clusters (25 clusters for example), since it will be hard to manage or keep track of so any segments. Having said that, it’s also not desirable to create too few clusters that the segments don’t add value.

## Analyzing the Clusters in Hierarchical Clustering

The table below shows the total number of data points in each cluster and the mean value for each cluster for every variable.

![Figure 9](https://github.com/gaganchane/hubway-clustering/blob/master/images/Figure9.png)

There are 2011 data points in cluster 1 with the average trip duration being 657 seconds. All the trips within this cluster occurred during the evening and only during weekdays. Lastly, about 77% of the trips in this cluster were taken by male and the average user age of trips taken was 32.

Cluster 2 contains 1567 data points with the highest average trip duration out of all clusters of 956 seconds. About 46% of the trips in this cluster occurred during the morning and 53% occurred in the afternoon, along with a very small percentage (1%) occurring during the evening. Almost all (99.4%) of the trips in this cluster occurred during weekdays with a small amount (0.6%) occurring during the weekend. Most of the trips (96.7%) in this cluster were taken by females and the average user age of all trips being 36.

Cluster 3 contains 1528 trips where the average trip time was 722 seconds. The trips in this cluster were spread through morning, afternoon, and evening equaling to 24,6%, 47.8%, and 27.6%, respectively. Another interesting insight is that this is the only cluster where all the trips occurred during the weekend and this makes sense since the trips are spread by a decent amount through the morning, afternoon, and evening instead of just one or two periods of the day like other clusters.

Cluster 4 contains 226 trips, and this is the lowest out of all clusters with the average trip time of 626 seconds. All of the trips occurred during the night and this explains that very few people use the Hubway during the night with most of them (64%) occurring during a weekday. 82% of the night trips were taken by males with the average age per trip being 29 (which is the lowest average age out of all clusters).

Cluster 5 which is the largest cluster contains 2261 trips with the average trip time being 607 seconds. All of the trips in this cluster occurred on weekday afternoons and taken by only male users. The average age per trip was 38.

The last cluster contained 2122 trips with the shortest average trip time of 554 seconds. All of the trips in this cluster occurred during weekday mornings and all the users were male. The average age per trip was 37.

## Analyzing the Clusters in KMeans Clustering

![Figure 10](https://github.com/gaganchane/hubway-clustering/blob/master/images/Figure10.png)

The table above shows the cluster numbers, the number of data points in each cluster and the mean value for each variable for each cluster. Cluster 9 has 2830 data points which is the most of all clusters and cluster 4 has only 6 data points which is the least out of all clusters. Interestingly, the average trip duration in cluster 4 is 29654 seconds which is about 29,000 seconds more than the cluster which has the second highest average trip duration. This explains that only a very few trips that had a very high trip duration were put into cluster 4. Cluster 10 contains only 226 data points and since all of the trips in this cluster occurred during the night, this explains that very few people would use Hubway during the night.

Furthermore, trips that were taken by an older crowd with an average age of 50 were clustered in cluster 7 which contains 956 data points. All trips in cluster 1, cluster 6, and cluster 7 were taken on a weekday afternoon with 806 points, 1326 points, and 956 points, respectively. All trips in cluster 2 and cluster 6 were taken by male users on a weekday. On the other hand, all trips in cluster 1 and 5 were taken by female users on a weekday. It is evident that most trips are taken during the morning or afternoon during weekdays.

## Determining Right Number of Clusters In KMeans

![Figure 10](https://github.com/gaganchane/hubway-clustering/blob/master/images/Figure11.png)

One way to pick the right number of clusters is to do the elbow method. In the figure above, the total within sum of squares (tot.withinss) with low amount of clusters is really high and that is not ideal. The right number of clusters would be where the tot.withinss isn’t too high but also not so small that it’s barely changing as the number of clusters are increased. Due to this, the elbow of the curve is a good estimate for the right number if clusters. Looking at the elbow of the curve, anywhere between 5-8 is an optimal number of clusters. This is because the change in tot.withinss is not significantly changing by increasing the number of clusters. Ten number of clusters are too many since it falls much after the elbow of the curve. Six number of clusters will be chosen going forward. The table below shows new results after conducting clustering using 6 clusters.

![Figure 10](https://github.com/gaganchane/hubway-clustering/blob/master/images/Figure12.png)

## Recommendations For Hubway

From the kmeans clusters, it is evident that most of the trips are taken during the morning and afternoon, and during weekdays. This is probably the result of people using Hubway to commute to and from work. In addition, only 2.3% (226) of the trips are taken during the night which is very small compared to other period of the day. Another insight that can be drawn is that most of the trips are taken by males. Lastly, only 16.7% of the trips are taken during the weekend. The current pricing model is not appropriate because currently, there is barely any revenue generation aside from the membership fee. The largest average duration out of all clusters is 941 seconds (~16 minutes). This means that there is no revenue being generated from overtime fees since it only applies for any trip time surpassing 30 minutes.

It is recommended that Hubway focuses on the segments where the trips taken by users are during the morning and afternoon. A strategy such as from the period of 6AM to 6PM on weekdays, the overtime fees are charged after 10 minutes since most trips in the morning and afternoon last 10-16 minutes on average. This will ensure that revenue from overtime fees is being generated during the busiest periods of the day. In addition, member of Hubway still have the incentive of having a higher time allowance during the evening, night, and the weekend.
