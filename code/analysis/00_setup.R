# ==============================================================================
# PROJECT SETUP SCRIPT
# ==============================================================================
# Purpose: Load libraries and set paths for the project
# Author: A
# ==============================================================================
# INSTRUCTIONS FOR USERS:
# 1. Edit the paths in Section 0.2 (PATH MANAGEMENT) for your device
# 2. Add any additional packages to 'required_packages' in Section 0.1
# ==============================================================================

# ==============================================================================
# 0 SET UP
# ==============================================================================
# 0.1. LIBRARY MANAGEMENT -------------------------------------------------------
# Automatically install and load required packages

# List of required packages
required_packages <- c(
  "here",           # For relative paths
  "tidyverse",      # Data manipulation and visualization
  "data.table",     # Fast data manipulation
  "readxl",         # Read Excel files
  "writexl",        # Write Excel files
  "haven",          # Read SPSS/Stata/SAS files
  "lubridate",      # Date handling
  "ggplot2",        # Advanced plotting
  "scales",         # Plot scales
  "patchwork",      # Combine plots
  "knitr",          # Report generation
  "kableExtra",     # Table formatting
  "stargazer",      # Regression tables
  "broom"           # Tidy model outputs
)

# Function to install and load packages
install_and_load <- function(packages) {
  for (pkg in packages) {
    if (!require(pkg, character.only = TRUE, quietly = TRUE)) {
      cat(sprintf("Installing package: %s\n", pkg))
      install.packages(pkg, dependencies = TRUE)
      library(pkg, character.only = TRUE)
    } else {
      library(pkg, character.only = TRUE)
    }
  }
  cat("All packages loaded successfully!\n")
}

# Install and load all required packages
install_and_load(required_packages)

# ==============================================================================
# 0.2. PATH MANAGEMENT ----------------------------------------------------------
# UNCOMMENT THE LINE FOR YOUR SYSTEM AND EDIT THE PATH:

# WINDOWS - MPIDR
project_root <- "U:/Projects/Project_Template"

# WINDOWS - HOME
# project_root <- "C:/Users/YourName/Projects/Project_Template"

# MAC
# project_root <- "~/Projects/Project_Template"

# Verify project root exists
if (!exists("project_root")) {
  stop("Please uncomment and edit your project_root path in section 0.2!")
}

if (!dir.exists(project_root)) {
  stop(sprintf("Project root does not exist: %s\nPlease check the path in section 0.2", project_root))
}

cat(sprintf("Project root: %s\n", project_root))

# Set working directory to project root
setwd(project_root)

# 0.3. DEFINE RELATIVE PATHS ----------------------------------------------------
# All paths are relative to project_root
path_data_raw <- file.path(project_root, "data", "0_raw")
path_data_selected <- file.path(project_root, "data", "1_selected_raw")
path_data_processed <- file.path(project_root, "data", "2_processed_data")
path_code_analysis <- file.path(project_root, "code", "analysis")
path_code_prepare <- file.path(project_root, "code", "prepare")
path_code_functions <- file.path(project_root, "code", "function", "R")
path_output_figures <- file.path(project_root, "output", "figures")
path_output_tables <- file.path(project_root, "output", "tables")
path_output_models <- file.path(project_root, "output", "models")

cat("All paths configured successfully!\n")

# 0.4. LOAD FUNCTIONS AND CREDENTIALS ------------------------------------------- 
# Load the functions
source("code/function/R/custom_functions.R")

# Load the user details
source("U:/accounts/authentification.R")
