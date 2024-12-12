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


# Plotting a graph directly comparing exponential and logistical growth methods

# Setting the time range for plotting to ensure dynamics of growth are captured appropriately:
time <- seq(0, 5000, by = 100)

# Calculating population sizes for each model at each time point:
exponential_values <- exponential_fun(time)
logistic_values <- logistic_fun(time)

# Creating a data frame to plot, with replicated time points for both models:
growth_comparison_data <- data.frame(
  Time = rep(time, 2),
  Population = c(exponential_values, logistic_values),
  Model = rep(c("Exponential", "Logistic"), each = length(time)))

# Plotting the graph with a logarithmic scale to account for large exponential growth numbers:
growth_comparison_plot <- ggplot(growth_comparison_data, aes(x = Time, y = Population, color = Model)) +
  geom_line(linewidth = 1) +
  scale_y_log10() +
  labs(
    title = "Comparison of Exponential and Logistic Growth",
    x = "Time",
    y = "Population (log scale)",
    colour = "Growth Model"
  ) + theme_minimal()

print(growth_comparison_plot)

# Saving the plot as an image so it can be uploaded to the repo and included in the README

ggsave("growth_comparison.png", growth_comparison_plot, width = 10, height = 6)
