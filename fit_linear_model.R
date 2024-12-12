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

# From the summary, we can see the intercept of log(N) ~ t gives the value of 6.8941709.
# We can take the exponential of this value to determine N0, giving us a value of 986.5075.

# We can also see the rate of change with respect to t is 0.010086. This is our value for r.

# Case 2. N(t) = K

# Filter data for t > 2500 to focus on the plateau phase 
data_subset2 <- growth_data %>% filter(t>2500)

# Fitting a linear model: N ~ 1
model2 <- lm(N ~ 1, data_subset2)
summary(model2)

# From the summary of this model, we can see the estimate intercept is 6e+10. This is our value for k. 