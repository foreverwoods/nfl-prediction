#### Preamble ####
# Purpose: Filters retrieved QB data for significant stats
# Author: Janssen Myer Rambaud
# Date: 3 April 2024
# Contact: janssen.rambaud@mail.utoronto.ca
# License: MIT
# Pre-requisites: 01-download_data.R

#### Workspace setup ####
library(tidyverse)
library(janitor)
library(dplyr)

#### Clean data ####
raw_data <- read_csv("data/qb_reg_raw_stats.csv")

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  filter(season == 2023) |>
  filter(week <= 9) |>   # zero out otw inf
  select(recent_team, passing_tds, week, completions, attempts, passing_yards, passing_yards_after_catch, sacks, passing_epa) |>
  tidyr::drop_na() |>
  group_by(recent_team)

#### Save data ####
write_csv(cleaned_data, "data/analysis_data.csv")


## ACTUAL
actual_data <-
  raw_data |>
  janitor::clean_names() |>
  filter(season == 2023) |>
  filter(week >= 10) |>   # zero out otw inf
  select(recent_team, passing_tds, week, completions, attempts, passing_yards, passing_yards_after_catch, sacks, passing_epa) |>
  tidyr::drop_na() |>
  group_by(recent_team)

#### Save data ####
write_csv(actual_data, "data/actual_data.csv")

