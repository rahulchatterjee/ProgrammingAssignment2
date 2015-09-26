## R fucntion which would be able to cache the inverse of its matrix rather than computing it repeatedly

## This function creates a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {
  m<-NULL
  set<-function(y){
  x<<-y
  m<<-NULL
}
get<-function() x
setmatrix<-function(solve) m<<- solve
getmatrix<-function() m
list(set=set, get=get,
   setmatrix=setmatrix,
   getmatrix=getmatrix)


}


## This function will check if the inverse has been computed and the matrix hasnt changed, then it will retrieve
## the inverse from its cache

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
