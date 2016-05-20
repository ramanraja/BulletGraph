# Bullet graphs
# see https://en.wikipedia.org/wiki/Bullet_graph
# (c) 2016 raman_raja@hotmail.com
# Disclaimer:
# This is free software, it is given to you with absolutely no warranty/ guarantee etc.
# If your aircraft crashes/nuclear device explodes prematurely  because of this software, 
# you have yourself to blame.

# Generate a simulated data frame in the right input format
simulateData = function(numbars=10)
{
  x = numeric(0)
  for (i in 1:numbars){
    x = cbind(x, round(rnorm(3,10,2)))
  }
  y = round(rnorm(numbars,18,4))
  z = round(colSums(x) - rnorm(numbars,8,2))
  #z[2]=NA  # if you want to suppress one of the markers
  x = rbind(x,y,z)
  df = as.data.frame(x)
  names(df) = paste("Item", 1:numbars)
  row.names(df) = c("gray1", "gray2", "gray3", "red", "blue")
  return (df)
}

# Input to this function should be a data frame with at least 3 rows:
# The first 3 rows give the size of the background gray bars
# Fourth row is the length of the red bars
# Fifth (optional) row is the position of the blue markers
# Manually adjust the aspect ratio of the plot for best looks
# Edit the code to adjust the width of the red lines and size & shape of the markers

bulletPlot = function(df, ...)
{
   bp = barplot(as.matrix(df[1:3, ]), names.arg=names(df), horiz=T, 
                border="white", las=2, ...)
   if(nrow(df) > 3)
       segments(0, bp, as.numeric(df[4,]), bp, col="red", lwd=6, lend="butt")
   if(nrow(df) > 4)
       points(df[5,], bp, col="blue", pch="|", cex=1.5) 
}

# Test drive it
set.seed(31415)
data = simulateData(8)
data
bulletPlot(data)
bulletPlot(data[1:3, ])
bulletPlot(data[1:4, ])
names(data) = paste("City", 1:ncol(data))
bulletPlot(data, main="Bullet Plot", xlab="Temperature")
bulletPlot(data, main="Bullet Plot", xlab="Temperature", col=c("wheat1", "wheat2", "wheat3"))

