# Description ------------------------------------------------------------------
# R script to process uploaded raw data into a tidy, analysis-ready data frame
# Load packages ----------------------------------------------------------------
## Run the following code in console if you don't have the packages
## install.packages(c("usethis", "fs", "here", "readr", "readxl", "openxlsx"))
#library(usethis)
library(fs)
library(here)
library(readr)
library(readxl)
library(openxlsx)
library(tidyverse)

# Read data --------------------------------------------------------------------
# Read the data and skip the initial empty rows and dataset description row
planetaryhdi <- read_excel("data-raw/HDR23-24_Statistical_Annex_PHDI_Table.xlsx", skip = 7)

# Tidy data --------------------------------------------------------------------
# Drop all columns that start with "..", these are empty columns for readability
planetaryhdi <- planetaryhdi[, !grepl("^\\.\\.", names(planetaryhdi))]

planetaryhdi <- planetaryhdi |>
  filter(rowSums(!is.na(select(planetaryhdi, -Country))) > 0)

# Rename columns:
new_col_names <- c("hdi_rank",
                   "country",
                   "hdi",
                   "phdi",
                   "pct_diff_hdi",
                   "rank_diff_hdi",
                   "adj_factor",
                   "tco2_per_capita_prod",
                   "co2_emissions_index",
                   "material_footprint_per_capita",
                   "material_footprint_index")

names(planetaryhdi) <- new_col_names

# Drop the first row
planetaryhdi <- planetaryhdi[-1, ]

# Export Data ------------------------------------------------------------------
usethis::use_data(planetaryhdi, overwrite = TRUE)
fs::dir_create(here::here("inst", "extdata"))
readr::write_csv(planetaryhdi,
                 here::here("inst", "extdata", paste0("planetaryhdi", ".csv")))
openxlsx::write.xlsx(planetaryhdi,
                     here::here("inst", "extdata", paste0("planetaryhdi", ".xlsx")))
