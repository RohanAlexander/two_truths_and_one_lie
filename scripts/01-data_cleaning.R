#### Preamble ####
# Purpose: Cleans the raw data obtained from the survey so that it can be analyzed.
# Author: Rohan Alexander
# Date: 28 March 2024
# Contact: rohan.alexander@utoronto.ca
# License: MIT
# Pre-requisites: Need to have manually downloaded the data.
# Any other information needed? -

#### Workspace setup ####
library(tidyverse)
library(arrow)

#### Clean data ####
raw_data <- read_csv("data/raw_data/Two truths and one lie (Responses) - Form responses 1.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  select(-timestamp) |>
  rename(certainty = how_certain_about_your_guess_are_you,
         guessed_correct = what_was_the_outcome) |> 
  mutate(guessed_correct = 
           if_else(guessed_correct == "Guessed right", 1, 0))


#### Save data ####
write_parquet(cleaned_data, "data/analysis_data/analysis_data.parquet")
