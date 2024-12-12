# Load and install packages if needed

library(ggplot2)

# Reminder of estimated parameters:

N0 <- exp(6.8941709) # Initial population size

r <- 0.010086 # Growth rate

K <- 6e+10  # Carrying capacity


# Defining exponential growth function

exponential_fun <- function(t) {
  N0 * exp(r * t)
}

# Defining logistic growth function

logistic_fun <- function(t) {
  (N0 * K * exp(r * t)) / (K - N0 + N0 * exp(r * t))
}


# Calculating exponential growth function when t = 4980

exponential_4980 <- exponential_fun(4980) # = 6.426362e+24


# Calculating logistic growth function when t = 4980

logistic_4980 <- logistic_fun(4980) # = 6e+10
