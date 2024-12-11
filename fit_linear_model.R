#Script to estimate the model parameters using a linear approximation
# install.packages("dplyr")
# library(dplyr)

growth_data <- read.csv("jose_logistic_data.csv")

# Case 1. K >> N0, t is small

# Filter data for t < 1500 to focus on early growth phase and compute log(N)
data_subset1 <- growth_data %>% filter(t<1500) %>% mutate(N_log = log(N))

# Fit a linear model: log(N) ~ t
model1 <- lm(N_log ~ t, data_subset1)
summary(model1)

# Case 2. N(t) = K

# Filter data for t > 2000 to focus on the plateau phase 
data_subset2 <- growth_data %>% filter(t>2000)

# Fitting a linear model: N ~ 1
model2 <- lm(N ~ 1, data_subset2)
summary(model2)
