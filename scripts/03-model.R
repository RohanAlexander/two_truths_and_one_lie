#### Preamble ####
# Purpose: Models the relationship between certainty of a guess and whether it was right
# Author: Rohan Alexander
# Date: 28 March 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: Need cleaned analysis dataset from 01-data_cleaning.R
# Any other information needed? -


#### Workspace setup ####
library(arrow)
library(tidyverse)
library(rstanarm)

#### Read data ####
analysis_data <- read_parquet("data/analysis_data/analysis_data.parquet")

### Model data ####
first_model <-
  stan_glm(
    formula = guessed_correct ~ certainty,
    data = analysis_data,
    family = binomial(link = "logit"),
    prior = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_intercept = normal(location = 0, scale = 2.5, autoscale = TRUE),
    prior_aux = exponential(rate = 1, autoscale = TRUE),
    seed = 853
  )


#### Save model ####
saveRDS(
  first_model,
  file = "models/first_model.rds"
)


