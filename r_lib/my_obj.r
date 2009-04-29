# A quick demo on using R code directly:
# >> stats_class :my_obj
# => MyObj
# >> MyObj.call 49,6
# => 13983816.0
my_obj <- function(n,k) choose(n, k)