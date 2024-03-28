#### Preamble ####
# Purpose: Tests the real analysis data based on our expectations from the simulation.
# Author: Rohan Alexander
# Date: 28 March 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: Need analysis data from 01-data_cleaning.R
# Any other information needed? -


#### Workspace setup ####
library(arrow)
library(tidyverse)


#### Test data ####
analysis_data <- read_parquet("data/analysis_data/analysis_data.parquet")

# Expect that guessed_correct is only ever 0 or 1.
max(analysis_data$guessed_correct) == 1
min(analysis_data$guessed_correct) == 0
### This test passed, but only after changing order and should be improved.
any(unique(analysis_data$guessed_correct) == c(1, 0))

# Expect that certainty is only ever an integer 0 to 10, inclusive.
max(analysis_data$certainty) == 10
min(analysis_data$certainty) == 0
any(unique(analysis_data$certainty) == c(0:10))

