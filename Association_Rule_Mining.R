#Imort File
book <- read.csv(file.choose(), header = FALSE , sep = ",")
summary(book)
## 55 vectors

##Load the book data into a sparse matrix. 
install.packages("arules")
library(arules)
book <- read.transactions(file.choose(), rm.duplicates = TRUE, sep = ",")
summary(book)

#3482 rows
#7787 columns (items)
#density of 0.0008099037 which only 0.0008099037 cells of this matrix have values and 
#the value equals to 1


##most frequent items
##a painted house: 286, a time to kill: 268, 1st to die: a novel:208, 2nd chance:200
##a walk to remember:165, Other:20833

#book has the highest frequency
#a painted house:286

#itemset length distribution
#1-173

#users rated/purchased 20 books in the matrix
#15

#first five transactions/users’ book information. 
inspect(book[1:5])

#itemFrequency to check the proportion of certain books
itemFrequency(book[,1:5]) #calculates the support for each item

#histogram plotting the books have more than 5 percent support
itemFrequencyPlot(book, support= 0.05, col = rainbow(4))

#Plot the first 10 books with highest support.
itemFrequencyPlot(book, topN = 10, col = rainbow(10))

#generate association rules on the matrix
apriori(book)

#Adjust the parameters: support = 0.01, confidence = 0.05 and minlen = 2. 
bookrules<- apriori(book, parameter = list(support = 0.01, confidence = 0.05, minlen = 2))
bookrules

#How many association rules have been generated?
#set of 12 rules

#Summarize the information of association rules 
summary(bookrules)
#How many rules have size 3?
#zero rules have size 3

#means of support, confidence and lift
##support-0.01465 , confidence - 0.2193, lift - 3.278

#Check the first ten rules
inspect(bookrules[1:10])

#If a user likes “a painted house”, which books else should be recommended to this user? 
#1st to die: a novel and 2nd chance

#Sort the rule list by lift and inspect the first ten rules with highest lift
inspect(sort(bookrules, by = "lift")[1:10])

#Find subsets of rules containing any “1st to die: a novel”
firstbookrule <- subset(bookrules, items %in% "1st to die: a novel")
inspect(firstbookrule)

#rules whoch include “1st to die: a novel”
##six rules 

#Find subsets of rules containing any “a time to kill”. 
secondbookrule <- subset(bookrules, items %in% "a time to kill")
inspect(secondbookrule)

#rules which include “a time to kill”
##six rules

#Sort the “a time to kill” rules by support.
inspect(sort(secondbookrule, by = "support"))

#rule with 3rd highest support
#{2nd chance}          => {a time to kill}

#If a user likes “a time to kill”, which book should be 
#recommended to him/her according to the rule with highest support?
##a painted house

#save the rules into a csv files 
write(bookrules, file = "bookrules.csv",
      sep =",", quote = TRUE, row.names = FALSE)

#convert the rules into a data frame
bookrules_df <- as(bookrules,"data.frame")
str(bookrules_df)
summary(bookrules_df$lift)
#Check the variables of this data frame
##5 variables

#What is the maximal value of Lift?
#6.864

#*****************************Apriori algorithm********************************************#
#1.	Giving the following large 3 itemsets, what are the candidate 4 itemsets?
#{1,5,6,7},{1,2,3,6},{1,2,5,7}

#2.	Giving the following large 4 itemsets, what are the candidate 5 itemsets?
#{1,2,3,6,7},{1,2,3,5,6},{1,2,3,7,9}

