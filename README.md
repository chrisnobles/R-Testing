IMPORTANT:
the functionalty of task 2 is entirely dependent on if the function average(){} from Task 1 is completed and working.

(i) Write a function zscore(m, na.rm) that takes the argument ‘m’ (a matrix) and converts the raw values of each variable into the z-scores, and then returns a matrix with the same dimensions and row and column names as ‘m’, but elements being the z-scores instead of the original raw scores. You should use the default assumption that variables are in columns (that is, each column of ‘m’ is a variable). For instance, column #1 contains values for variable #1. The function zscore() must not use any loops. You can only use the average(), sd(), apply(), sweep(), and return() functions inside zscore().

(ii) The second argument ‘na.rm’ is a logical value (TRUE or FALSE), which tells the function how to handle the missing values (NA). The default value for ‘na.rm’ must be FALSE. Inside the body of the zscore() function you need to pass its value of the ‘na.rm’ argument to average() and sd() functions (see part (iv) below).

(iii) The z-score for element in row i of column j is calculated as: z(i, j) = [raw(i, j) – aver(j)]/stddev(j) where aver(j) is the average value for column j, stddev(j) is the standard deviation for column j, raw(i,j) is the raw value for element in row i of column j.

(iv) Use your function average() from part (1) to calculate the average and the base R function sd() to calculate the standard deviation for each variable. Note that you will need to pass the value of ‘na.rm’ argument of zscore() inside its body to average() and sd() functions, so that all functions utilize the same way of handling NAs.

(v) Use the ‘mat’ matrix produced by my code in ‘project_1.R’ file (in folder ‘Project 1’) as an input to the zscore() function to generate a matrix that contains the z-scores instead of the raw scores. Let’s call this new matrix “zmat1”. Naturally, the original row and column names from ‘mat’ must be preserved in “zmat1”.

(vi) Sort the columns of ‘zmat1’ according to their names in alphabetical order. Place this sorted matrix into ‘zmat2’. Then, sort elements in the first column of ‘zmat2’ in increasing order, while preserving the relationship across the rows in all the columns. Place the sorted matrix into ‘zmat3’. This means that you will need to correctly apply the order() function twice: first time it will be applied to ‘zmat1’, second time it will be applied to ‘zmat2’.
