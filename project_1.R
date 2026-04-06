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
print("zmat2")
print(zmat2)
print("zmat3")
print(zmat3)
