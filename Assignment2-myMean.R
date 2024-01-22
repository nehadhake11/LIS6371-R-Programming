assignment2 <- c(16, 18, 14, 22, 27, 17, 19, 17, 17, 22, 20, 22)
myMean = function(assignment2) {
  return(sum(assignment2)/length(assignment2)) 
}
#your turn
#program was executing as given. but the program only has vector initialization and mymean function definition.
#the my mean function takes a vector as an argument and calls built-in R functions  sum and length 
#to calculate sum of the elements of vector and length of the data set vector
#these results are used to perfom arithmatic operation "/" and result of the division arithmatic operation is returned as return value.

#In order to execute function we need to make function call to myMean and pass assignment2 vector as an argument
#function returns a value as calculated mean. and we can use built in print or cat function to print the results.

x = myMean(assignment2)
cat('Calculated mean is :', x,"from vector")
