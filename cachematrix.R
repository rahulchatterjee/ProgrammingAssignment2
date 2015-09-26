## R Program to cache inverse of a matrix rather than compute it repeatedly

## Function to create special matrrix cache to cache its inverse

makeCacheMatrix <- function(x = matrix()) {
m <- NULL

set <- function(y) {
x <<- y
m <- NULL
}

get<-function() x
setmatrix <-function(solve) m<<- solve
getmatrix <-function() m
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)
}

## This function checks if the inverse has been calculated and the matrix hasn't changed, then it will retrieve the cache from
## its inverse

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m<-x$getmatrix()
    if(!is.null(m)){
      message("getting cached data")
      return(m)
    }
    matrix<-x$get
    m<-solve(matrix, ...)
    x$setmatrix(m)
    m    
}
