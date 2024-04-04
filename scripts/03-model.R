#### Preamble ####
# Purpose: Create model for passing_epa based on first 9 week stats
# Author: Janssen Myer Rambaud
# Date: 3 April 2024
# Contact: janssen.rambaud@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R, 02-data_cleaning.R


#### Workspace setup ####
library(tidyverse)
library(tidymodels)

#### Read data ####
analysis_data <- read_csv("data/analysis_data.csv")

set.seed(111)

qb_model <- 
  linear_reg() |>
  set_engine("lm") |>
  fit(
    passing_epa ~ completions + attempts + passing_yards + passing_yards_after_catch + passing_tds + sacks,
    data = analysis_data
    )


#### Save model ####
saveRDS(
  qb_model,
  file = "models/qb_model.rds"
)



