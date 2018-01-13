## The first function creates a Matrix and is able to store its inverse in cache
## The second function figures out the inverse and calls functions of the first one to store it in cache

## This function assigns a matrix to x and is able to cache its inverse, saves also every element of the environment into a list

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inv) i <<- inv
  getinverse <- function() i
  list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
  
}


## This function figures out the inverse, and sotres it in chache calling to sub-functions of previous one

cacheSolve <- function(x, ...) {
  i <- x$getinverse()
  if (!is.null(i)) {
    message("getting cashed inverse")
    return(i)
  }
  mtrx <- x$get()
  invrs <- solve(mtrx)
  x$setinverse(invrs)
  invrs
        ## Return a matrix that is the inverse of 'x'
}
