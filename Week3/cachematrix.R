## Make a matrix and return a list of function that can be operated using the matrix object

## Function below makes a new matrix object with 4 executable function

makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  getInverse <- function() inverse
  get <- function() x
  set <- function(y){
    x <<- y
    inverse <<- NULL
  }
  setInverse <- function(Inv) inverse <<- Inv
  list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}


## Function below calculates the inverse of a matrix, just pass the matrix object

cacheSolve <- function(x, ...) {
  Inv <- x$getInverse()
  if(!is.null(Inv)){
    return(m)
  }
  matrix <- x$get()
  Inv <- solve(matrix)
  x$setInverse(Inv)
  Inv
}

#First make an object like, matrix1 <- makeCacheMatrix(matrix(c(4, 7, 2, 6), nrow = 2))
#try the function that come from creating the matrix object if you want, matrix1$get() or matrix1$getInverse()
#calculate the inverse, Inv1 <- cacheSolve(matrix1)
#To test if the inverse is correctly calculated, we try to get its identity matrix using below code,

#round(matrix1$get() %*% Inv1, 5)

#If we calculate the inverse correctly, we will get this matrix,

#     [,1]   [,2]
#[1,]    1    0
#[2,]    0    1