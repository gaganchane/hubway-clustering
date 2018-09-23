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
  - [Determining Right Number of Clusters](#determining-right-number-of-clusters)
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

