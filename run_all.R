# Master script to run entire analysis pipeline
# Author: Aijie
# Last updated: 2026-01-06

# Setup ----
cat("Starting analysis pipeline...\n")
start_time <- Sys.time()

library(here)

# 1. Data Preparation ----
cat("\n=== STEP 1: Data Preparation ===\n")
# Add your preparation scripts here

# 2. Analysis ----
cat("\n=== STEP 2: Analysis ===\n")
source(here("code", "analysis", "00_setup.R"))
source(here("code", "analysis", "01_data_preparation.R"))
source(here("code", "analysis", "02_descriptive_stats.R"))

# 3. Completion ----
end_time <- Sys.time()
duration <- difftime(end_time, start_time, units = "mins")

cat("\n=== ANALYSIS COMPLETE ===\n")
cat(sprintf("Total runtime: %.1f minutes\n", duration))