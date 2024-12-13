  #  Reproducible Research: Version Control and R

**QUESTION 1**

### **Introduction and Data Source**:

This project investigates the growth of _Escherichia coli_ in a 1 ml test tube. The data simulates bacterial growth starting from an initial suspension in 100 μl of media, with exponential growth transitioning to a plateau as resources are depleted - the population eventually stabilises at the carrying capacity. 

The aim of this project is to estimate initial population size (_N<sub>0</sub>_), growth rate (_r_) and carrying capacity (_K_) of the bacteria, using dataset "jose_logistic_data.csv" uploaded to the Open Science Framework's website (https://osf.io). This dataset records the population size (_N_) at consistent time intervals (_t_). 

### **Methods and Analysis**:

The dataset "jose_logistic_data.csv" was used for this analysis.

1. **Data Exploration (plot_data.R)**:

We plotted:

a) The raw data (_N_ v.s. _t_) on a linear scale, in order to observe overall growth patterns. This revealed a sigmoidal logistic growth relationship, where population numbers started low and grow exponentially, until approaching carrying capacity where the population growth plateaus. 

![raw_population_data](https://github.com/user-attachments/assets/d6a6c69a-11d5-4850-a3e8-8d93e63147db)

b) The log-transformed data (log(_N_) vs. _t_) in order to visualise exponential growth as a linear relationship on a semi-log plot. This reveals constant growth over time, until the population size hits carrying capacity and remains constant. This reflects the stationary phase of logistic growth, and allows us to carry out linear analysis. 

![image](https://github.com/user-attachments/assets/64642c14-be23-4caa-8585-a01422b9ebab)

2. **Parameter Estimation (fit_linear_model.R)**:
A linear model was fitted to the data, focusing on two distinct growth stages in order to esimate the parameters of initial population size, growth rate and carrying capacity. The details of how each value is acquired is within the code file. 

   - Exponential growth phase (_t_ < 1500\) was used to estimate _r_ and _N<sub>0</sub>_ .
   - Plateau phase (_t_ > 2500\) was used to estimate _K_.

### Results (plot_data_and_model.R)
- **Initial Population Size (N_0\)**: e<sup>6.8941709</sup> = 987 (to the nearest colony)
- **Growth Rate (r\)**: 0.010086
- **Carrying Capacity (K\)**: 6e+10
  
These estimates can be used to plot a logistic growth model, shown below and in plot_data_and_model.R - we can directly compare this to the raw data plotted in part 1. of the data exploration in order to assess fit. 

![image](https://github.com/user-attachments/assets/f68aa1c4-826b-4689-9934-a022c8e66a83)

By comparing the two, we can see that these results provide a model with a close fit to the data, indicating the estimates for the parameters listed above are appropriate to describe the _E. coli_ population growth. 

## **QUESTION 2 - Use your estimates of N0 and r to calculate population size at t = 4980 min, assuming the population grows exponentially. How does it compare to the population size predicted under logistic growth?**

**PLEASE NOTE: all calculations below can be found in the 'exp_vs_log_growth.R' script**

Values from parameter estimation:

- **Initial Population Size (N_0\)**: e<sup>6.8941709</sup> = 987 (to the nearest colony)
- **Growth Rate (r\)**: 0.010086
- **Carrying Capacity (K\)**: 6e+10

From calculations carried out in R: 

- **Exponential model:** returns a population value of 6.426362e+24 at _t_ = 4980.

- **Logistic growth model:** returns a population value of 6e+10 at _t_ = 4980. 

From the results of the models, it is clear that under exponential growth the population of _E. coli_ would become orders of magnitude bigger than if under logistic growth, where it would be capped at 6e+10 i.e. the carrying capacity. This is not surprising, as logistical models assume an eventual plateau in growth due to limiting factors such as space or resources essential for growth. On the other hand, exponential models do not take these limiting factors into account, assuming the bacteria can grow infinitely with infinite resource and space availability - hence the unrealistically large estimate provided. 

## **QUESTION 3 - Add an R script to your repository that makes a graph comparing the exponential and logistic growth curves (using the same parameter estimates you found). Upload this graph to your repo and include it in the README.md file so it can be viewed in the repo homepage.**

**PLEASE NOTE: all graphing code can be found in the 'exp_vs_log_growth.R' script**

The code from the script produces the following graph:

![image](https://github.com/user-attachments/assets/db55cc73-2c7b-4edb-894c-7aaec4f9b2ca)


