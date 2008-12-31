library(MASS)
matrix_from_list <- function (x,y) matrix(x, nrow=y)
inverseFromList <- function(x,y) ginv(matrix_from_list(x,y))
inverse_mean <- function (x) ginv(x)