  #  Reproducible research: version control and R

**Introduction and Data Source**:

This project investigates the growth of Escherichia coli in a 1 ml test tube. The data simulates bacterial growth starting from an initial suspension in 100 μl of media, with exponential growth transitioning to a plateau as resources are depleted - the population eventually stabilises at the carrying capacity. 

The aim of this project is to estimate initial population size (_N<sub>0</sub>_), growth rate (_r_) and carrying capacity (_K_) of the bacteria, using dataset "jose_logistic_data.csv" uploaded to the Open Science Framework's website (https://osf.io). This dataset records the population size (_N_) at consistent time intervals (_t_). 

**Analysis**:

1. **Data Exploration (plot_data.R)**: We plotted the raw data (`N` vs. `t`) and log-transformed data (`log(N)` vs. `t`) to visualize exponential and logistic growth phases.

2. **Parameter Estimation (fit_linear_model.R and plot_data_and_model.R)**:
   - Exponential growth phase (\(t < 1500\)) was used to estimate \(r\) by fitting a linear model to `log(N)` vs. `t`.
   - Plateau phase (\(t > 2000\)) was used to estimate \(K\) as the mean population size during this phase.
   - \(N_0\) was directly observed as the initial population size (\(N\) when \(t = 0\)).

## Results
- **Initial Population Size (\(N_0\))**: 879
- **Growth Rate (\(r\))**: 
- **Carrying Capacity (\(K\))**: 
