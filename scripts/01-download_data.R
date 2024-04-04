#### Preamble ####
# Purpose: Downloads and saves the QB data from nflverse
# Author: Janssen Myer Rambaud
# Date: 3 April 2024
# Contact: janssen.rambaud@mail.utoronto.ca
# License: MIT
# Pre-requisites: None


#### Workspace setup ####
library(tidyverse)
library(nflverse)


#### Download data ####
qb_reg_raw_stats <- 
  load_player_stats(seasons = TRUE) |> 
  filter(season_type == "REG" & position == "QB")


#### Save data ####
write_csv(qb_reg_raw_stats, "data/qb_reg_raw_stats.csv") 

         
