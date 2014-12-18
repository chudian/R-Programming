# The following function returns the inverse of the matrix. It first checks if
# the inverse has already been computed. If so, it gets the result and skips the
# computation. If not, it computes the inverse, sets the value in the cache via
# setinverse function.

# This function creates a special "matrix" object that can cache its inverse.
# makeCacheMatrix creates a list containing a function to
# 1. Initializes a variable 'inv' 
#    (which will be used to save inverse matrix latter, i.e. a cached data);
# 2. Provides function get() to obtain "raw" matrix (of which one needs to find 
#    its inverse);
# 3. Provides function setinverse() to assign computed inverse matrix (of x) to m;
# 4. Provides function getinverse() to obtain the cached inverse matrix.
makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    get <- function() x
    setinverse <- function(inverse) inv <<- inverse
    getinverse <- function() inv
    
    # return a list of functions as an R object
    list(get=get, setinverse=setinverse, getinverse=getinverse)
}

# This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
# If the inverse has already been calculated (and the matrix has not changed), 
# then the cachesolve should retrieve the inverse from the cache.
cacheSolve <- function(x, ...) {
    # Return a matrix that is the inverse of 'x'
    inv <- x$getinverse()
    if(!is.null(inv)) {
      message("getting cached data.")
      return(inv)
    }
    else {
      message("No cached data found. Calculating inverse matrix...")
    }
    data <- x$get() # obtains matrix from object x
    inv <- solve(data)  # finds inverse matrix
    x$setinverse(inv) # assigns resulting inverse matrix to object x
    message("Completed.")
    return(inv)
}
