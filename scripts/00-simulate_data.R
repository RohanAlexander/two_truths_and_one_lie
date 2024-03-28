#### Preamble ####
# Purpose: Simulates a relationship between the certainty of a guess and whether it was right.
# Author: Rohan Alexander
# Date: 28 March 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: -
# Any other information needed? -


#### Workspace setup ####
library(tidyverse)


#### Simulate data ####
simulated_data <- 
  tibble(
    certainty = runif(n = 1000, min = 0, max = 11) |> floor(),
    guessed_correct = runif(n = 1000, min = 0, max = 2) |> floor(),
  )


#### Add tests for simulated data ####
# Expect that guessed_correct is only ever 0 or 1.
max(simulated_data$guessed_correct) == 1
min(simulated_data$guessed_correct) == 0
any(unique(simulated_data$guessed_correct) == c(0:1))

# Expect that certainty is only ever an integer 0 to 10, inclusive.
max(simulated_data$certainty) == 10
min(simulated_data$certainty) == 0
any(unique(simulated_data$certainty) == c(0:10))



