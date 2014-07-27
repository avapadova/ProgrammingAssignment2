## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## Assignment 2, R Programming
##
## makeCacheMatrix function
makeCacheMatrix <- function(x = matrix()) {
        # take NULL if nothing is cached or returns the cached value
        # nothing is cached initially, so it is set to NULL
        cache <- NULL
        #
        # stores a matrix
        setMatrix <- function(newValue) {
                x <<- newValue
                # a new value is assigned, flush the cache
                cache <<- NULL
        }
        #
        # returns the stored matrix in x
        getMatrix <- function() {
                x
        }
        #
        # caches the argument 
        cacheInverse <- function(solve) {
                cache <<- solve
        }
        #
        # gets the cached value
        getInverse <- function() {
                cache
        }
        #
        # returns a list where all the elements of the list are a function
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}


## Write a short comment describing this function
##
## makeCacheSove function
cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        
        # gets the cached value
        inverse <- x$getInverse()
        # if cached values exist returns these values
        if(!is.null(inverse)) {
                message("Getting the cached data")
                return(inverse)
        }
        # else if  gets the matrix and caclulates the inverse matrix and 
        # stores it in the cache
        data <- x$getMatrix()
        inverse <- solve(data)
        x$cacheInverse(inverse)
        
        # returns the inverse matrix
        inverse
}
