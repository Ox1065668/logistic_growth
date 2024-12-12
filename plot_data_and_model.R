#Script to plot data and model

growth_data <- read.csv("jose_logistic_data.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- exp(6.8941709)

r <- 0.010086 

K <- 6e+10


# Plotting the data and logistic growth model

library(ggplot2)


ggplot(aes(t, N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() + 
  xlab("Time (t)") +
  
  ylab("Population (N)") +
  
  scale_y_continuous(trans='log10')

sink(file="package-versions.txt")
sessionInfo()
sink()
