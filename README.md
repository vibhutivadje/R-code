# R-code

#K-means Clustering
We will use wine data for k means clustering example. The data is the results of a chemical analysis of wines grown in the same region in Italy but derived from three different cultivars. The analysis determined the quantities of 13 constituents found in each of the three types of wines.
The class variable, indicating three different cultivars, is represented by the three integers: 1 to 3. The rest attributes describing wine are presented below:
 1) Alcohol; 2) Malic acid; 3) Ash; 4) Alcalinity of ash; 5) Magnesium; 6) Total phenols; 7) Flavanoids; 8) Nonflavanoid phenols; 9) Proanthocyanins; 10)Color intensity; 11)Hue; 12)OD280/OD315 of diluted wines; 13)Proline. These 13 attributes are all numeric. 
The objective of using this data set for clustering practice is to see how to use clusters predicting wine class. 

#Association Rule Mining for Books.csv
We want to identify books that our customers are interested in, based on (all of) their previous purchases and book interests. We can get information about their book interests two ways: either they’ve purchased a book from us, or they’ve rated the book on our website (even if they bought the book somewhere else). In this case, a transaction is a customer, and an itemset is all the books that they’ve expressed an interest in, either by purchase or by rating.
The data that we’ll use is based on data collected in 2004 from the book community
Book-Crossing5 for research conducted at University of Freiburg.  The original dataset is called bookdata.tsv. Each row of the file consists of a user ID, a book title (which designed as a unique ID for each book), and the rating. We then further processed the data into a new data frame, with each row consists of book titles rated or purchased by a single user. We select 1756 rows, which are 1756 users’ book preference.
