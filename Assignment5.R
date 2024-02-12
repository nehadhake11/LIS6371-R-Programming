A = matrix(1:100, nrow=10)
B = matrix(1:1000, nrow=10)
if (nrow(A) == ncol(A)){
  if(det(A) == 0){
    print ("determinant of A is 0, Hence A is invertible")
  } else {
    A_i = solve (A)
    print("Inverse of A: ")
    print(A_i)
  }  
} else {
  print ("A is not a square matrix, Hence A is invertible")
}

if (nrow(B) == ncol(B)){
  if(det(B) == 0){
    print ("determinant of B is 0, Hence B is invertible")
  } else {
    B_i = solve (B)
    print("Inverse of B: ")
    print(B_i)
  }  
} else {
  print ("B is not a square matrix, Hence B is invertible")
}

S <- matrix(2:5, nrow = 2)
det_S <- det(S)
print(S)
if (nrow(S) == ncol(S)){
  if(det_S == 0){
    print ("determinant of B is 0, Hence B is invertible")
  } else {
    S_i = solve (S)
    print("Inverse of S: ")
    print(S_i)
  }  
} else {
  print ("S is not a square matrix, Hence S is invertible")
}
solve(S)
