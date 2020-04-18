#Import wine data into R 
wine <- read.csv(file.choose())
str(wine)
#change variable Class into a factor variable.
wine$Class <- factor(wine$Class)
str(wine)

#average alcohol for wine in class 1, 2 and 3 respectively
aggregate(data = wine, Alcohol~Class, mean)
#Class  Alcohol
#   1 13.74475
#   2 12.27873
#   3 13.15375

#average Flavanoids for wine in class 1, 2 and 3 respectively
aggregate(data = wine, Flavanoids~Class, mean)
# Class Flavanoids
#     1  2.9823729
#     2  2.0808451
#     3  0.7814583

#average color for wine in class 1, 2 and 3 respectively
aggregate(data = wine, Color~Class, mean)
# Class   Color
#     1 5.528305
#     2 3.086620
#     3 7.396250

#Scale the variables except the Class variable in the dataset
winex <-  wine[,-1]
str(winex)
#save these scaled variables in a new data frame(standarize)
winex_scaled <- as.data.frame(lapply(winex,scale))

#k-means cluster model on the new data frame with k = 3
k = 3
set.seed(5) 
wine_clusters <- kmeans(winex_scaled, k)
#size of the clusters
wine_clusters$size
#wines in cluster 1 - 62
#wines in cluster 2 - 65
#wines in cluster 3 - 51

#cluster centers
wine_clusters$centers
#center values for color variable
#1: 0.1705823
#2: -0.8993770
#3: 0.9388902

#cluster IDs to the original data frame
wine$cluster <- wine_clusters$cluster
View(wine)
#the first five records of the data frame with cluster IDs
wine[1:5,]
#wines in class 1, 2 and 3 respectively
table(wine$Class)
#1  2  3 
#59 71 48 

#wines are in cluster 1, 2 and 3
table(wine$cluster)
#1  2  3 
#62 65 51

#both class and cluster variables
table(wine$Class,wine$cluster)

#class-1 is equivalent to cluster 1
#class-2 is equivalent to cluster 2 
#class-3 is equivalent to cluster 3 

#How many wines are predicted wrongly based on the table?
#6 wines predicted wrongly based on the table

#Plotting the cluster assignments on alcohol and Flavanoids scatter plot
plot(wine$Alcohol,wine$Flavanoids)

#hide dots
plot(wine$Alcohol,wine$Flavanoids, type = "n")

#plot with alcohol as x coordinate, Flavanoids as y coordinate, 
#label as class numbers and different colors for different clusters. 
text(x=wine$Alcohol, y=wine$Flavanoids, labels= wine$Class, col = wine$cluster)

#wines labeled as different classes are in cluster 1?
# 3 are labeled as different classes are in cluster 1
# 0 are labeled as different classes are in cluster 2
# 3 are labeled as different classes are in cluster 3

#average values of variable alcohol, Flavanoids and color for different clusters.
aggregate(data = wine, Alcohol~cluster, mean)
# cluster  Alcohol
#      1 13.67677
#      2 12.25092
#      3 13.13412
aggregate(data = wine, Flavanoids~cluster, mean)
# cluster Flavanoids
#       1  3.0032258
#       2  2.0500000
#       3  0.8188235
aggregate(data = wine, Color~cluster, mean)
# cluster  Color
#      1 5.453548
#      2 2.973077
#      3 7.234706

#average of alcohol for cluster 3
#13.13412

#average of color for cluster 2
#2.973077

#average of Flavanoids for cluster 1
#3.0032258

#results similar to what we got from Q2
#yes, there is no much difference compared to results from Q2



