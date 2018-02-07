## Coursera R Programming Course
## Week 3 Peer-Graded Programming Assignment 2: Lexical Scoping
## This assignment helps us put into practice the scoping rules in R and
## shows us how these rules can be used to preserve state inside an R object.

## Cherie Bardsley
## February 7, 2018

## The makeCacheMatrix function creates a special "matrix" that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) { ## Specify the format to be a matrix in the function argument.
        ## Assign a NULL value to i; i will contain the inverse of the matrix.
        i <- NULL
        ## Set the value of the matrix
        set <- function(y) {
                ## Use the <<- operator to assign a value to an object in the parent environment.
                x <<- y
                ## If a new matrix is being created, set i to NULL
                i <<- NULL
        }
        ## Get the value of the matrix
        get <- function() x
        ## Set the value of i in the parent environment
        setinverse <- function(inverse) i <<- inverse
        ## Get the value of i
        getinverse <- function() i
        ## Create a list of the functions so you can refer to them as needed using the $ operator
        list(set = set, get = get, setinverse = setinverse, getinverse = getinverse)
}


## The cacheSolve function computes the inverse of the special "matrix" returned by the makeCacheMatrix above.
## If the inverse has already been computed and the matrix has not changed, the cacheSolve function
## will fetch the inverse from the cache.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        i <- x$getinverse()
        ## If the inverse of 'x' has already been computed, fetch the inverse from the cache.
        if(!is.null(i)) {
                message("getting cached matrix")
                return(i)
        }
        ## If the inverse of 'x' has not been computed or the matrix has changed, compute the inverse
        ## and set the value of the inverse in the cache.
        data <- x$get()
        ## Computing the inverse of the matrix using the solve() function in R.
        i <- solve(data, ...)
        x$setinverse(i)
        i
}
