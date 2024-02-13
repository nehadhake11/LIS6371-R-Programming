A <- matrix(c(2,0,1,3), ncol=2) 
B <- matrix(c(5,2,4,-1), ncol=2)
#Addition of the matrices.
result_addition <- A + B
cat("Result of addition","\n")
print(result_addition)


A <- matrix(c(2,0,1,3), ncol=2) 
B <- matrix(c(5,2,4,-1), ncol=2)
#Subtraction of the matrices.
result_substraction <- A - B
cat("Result of substraction","\n")
print(result_substraction)


# Using diag() function to build a matrix
diagonal_numbers <- c(4, 1, 2, 3)
size <- length(diagonal_numbers)
Diagonal_Matrix <- diag(diagonal_numbers, nrow = 4, ncol = 4)
print(Diagonal_Matrix)


#Generating a matrix

# Define the diagonal numbers
diagonal_number <- c(3, rep(3, 4))
# Generate the matrix using diag()
matrix_numbers <- diag(diagonal_number)
# Fill the first row with 1s
matrix_numbers[1, -1] <- 1
# Fill the first column with 2s
matrix_numbers[-1, 1] <- 2
print(matrix_numbers)
