#Script to plot data and model

growth_data <- read.csv("jose_logistic_data.csv")

logistic_fun <- function(t) {
  
  N <- (N0*K*exp(r*t))/(K-N0+N0*exp(r*t))
  
  return(N)
  
}

N0 <- 879 # Initial population size - corresponding N value when t=0
  
r <- coef(model1)["t"] # Intrinsic growth rate - the slope of the exponential model
  
K <- mean(growth_data$N[growth_data$t > 2000]) # Carrying capacity - the mean of N for the plateau phase


# Plotting the data and logistic growth model

library(ggplot2)


ggplot(aes(t, N), data = growth_data) +
  
  geom_function(fun=logistic_fun, colour="red") +
  
  geom_point() +

  scale_y_continuous(trans='log10')

sink(file="package-versions.txt")
sessionInfo()
sink()
