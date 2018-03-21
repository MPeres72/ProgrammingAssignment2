## Put comments here that give an overall description of what your
## functions do

## These function creates a list with 4 functions to load a Matrix,
## read these Matrix, load the inverse of a  Matrix and read the
## inverse of a Matrix in and from the cache.

makeCacheMatrix <- function(x = numeric()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(solve) m <<- solve
        getinv <- function() m
        list(set = set, get = get,
             setinv = setinv,
             getinv = getinv)
}


## These function receives a variable that contains a Matrix, check if
## the inverse of this variable already exists in the cache. If the 
## inverse exists, read this value from cache and show a message.

cacheSolve <- function(x, ...) {
        m <- x$getinv()
        if(!is.null(m)) {
                message("getting cached inverse")
                return(m)
        }
        data <- x$get()
        m <- solve(data, ...)
        x$setinv(m)
        m
}
