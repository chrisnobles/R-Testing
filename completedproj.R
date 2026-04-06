# -------------- Code to generate matrix 'mat' --------------------------------

# Use the code below to generate matrix 'mat' for your assignment
# Note that in order to generate the same matrix every time you
# need to execute the code below with set.seed(1234)
# If you skip this code, a unique matrix will be generated every time
set.seed(1234)
# Matrix elements are populated by random numbers from normal distribution with
# mean=100 and standard deviation=20, which are rounded off to 1 decimal point
mat <- matrix(round(rnorm(n = 20*10, mean = 100, sd = 20), digits = 1),
              nrow = 20, ncol = 10)
# Unique column names are generated randomly from letters in 'LETTERS' vector
cnam <- sample(LETTERS, 10, replace = FALSE)
print(cnam)
colnames(mat) <- cnam
print(mat)

# ------------------------------------------------------------
# (1) average(x, na.rm)
# ------------------------------------------------------------
average <- function(x, na.rm = FALSE) {

  if (!is.numeric(x)) {
    stop("Error: argument 'x' must be a numeric or integer vector.")
  }

  if (na.rm == TRUE) {
    total <- 0
    count <- 0

    for (i in 1:length(x)) {
      if (!is.na(x[i])) {
        total <- total + x[i]
        count <- count + 1
      }
    }

    if (count == 0) {
      return(NaN)
    }

    return(total / count)

  } else {
    total <- 0

    for (i in 1:length(x)) {
      if (is.na(x[i])) {
        return(NA)
      }
      total <- total + x[i]
    }

    return(total / length(x))
  }
}

# -------------------------- Question #2 -------------------------- #

  #define a function zscore that takes in matrix m and na.rm as parameters
  zscore <- function(m, na.rm = FALSE) {
    
    #for each column inside of m, compute the average
    columnAverage <- apply(m, 2, average, na.rm = na.rm)
    
    #compute the standard deviation for each column inside of m
    columnStdev <- apply(m, 2, sd, na.rm = na.rm)
    
    #convert every entry into a zscore given z(i,j) = [raw(i,j) - average(j)]/stddev(j)
    zscoreMatrix <- sweep(m, 2, columnAverage, "-") #first, subtract the mean from each entry
    zscoreMatrix <- sweep(zscoreMatrix, 2, columnStdev, "/") #next, divide each entry by the standard dev
    
    #return the transformed matrix
    return(zscoreMatrix)
    
  }

#use the mat matrix produced earlier as an input to the zscore function that contains the zscore instead of raw scores. Call this zmat1
zmat1 <- zscore(mat, na.rm = FALSE)

#sort the columns of ‘zmat1’ according to their names in alphabetical order. Place this sorted matrix into zmat2 
zmat2 <- zmat1[, order(colnames(zmat1))]

#then, sort elements in the first column of ‘zmat2’ in increasing order, while preserving the relationship across the rows in all the columns. Place the sorted matrix into zmat3
zmat3 <- zmat2[order(zmat2[,1]),]

print("zmat1")
print(zmat1)
print(" ")
print("zmat2")
print(zmat2)
print(" ")
print("zmat3")
print(zmat3)
