# Script to plot the logistic growth data

# Reading the dataset
growth_data <- read.csv("jose_logistic_data.csv")

# Installing ggplot 2
install.packages("ggplot2")
library(ggplot2)

# Plot 1: N vs t (raw population data)

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("Time (t)") +
  
  ylab("Population (N)") +
  
  theme_bw()

# Plot 2: log(N) vs t (log-transformed population data)

ggplot(aes(t,N), data = growth_data) +
  
  geom_point() +
  
  xlab("Time (t)") +
  
  ylab("Log(Population)") +
  
  scale_y_continuous(trans='log10')
