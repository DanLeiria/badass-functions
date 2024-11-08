### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# HEADER ----
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Author:       Daniel Leiria
# Copyright     Copyright 2024 - Daniel Leiria
# Email:        daniel.leiria@danfoss.com / daniel.h.leiria@gmail.com
#
# Date:         2024-11-02
#
# Script name:  C:/Users/U437184/OneDrive - Danfoss/Personal/Badass-functions/miscellaneous/benchmark-my-pc-performance.R
# R version:    4.4.1
# 
# Script Description:
# Setup the packages needed for the specific project.
# Benchmark your machine to assess its computer power.


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# SETUP ----
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Description:
# Clears the console.
# Remove all variables of the work space.

cat("\014")
rm(list = ls())


### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# LIBRARY ----
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### Description:
# Add below your list of packages required for this project.

# List of required libraries
required_libraries <- c(
 "tidyverse",                                                                   # Important packages. 
 "profvis",                                                                     # Code profiling.
 "benchmarkme"                                                                  # Benchmark computer.
 
) 

# Install missing libraries automatically
install_if_missing <- function(packages) {
missing_packages <- packages[!(packages %in% installed.packages()[, "Package"])]
if (length(missing_packages)) {
  message("Installing missing packages: ", paste(missing_packages, collapse = ", "))
  install.packages(missing_packages)
 }
}

# Call the function to install missing packages
install_if_missing(required_libraries)

# Load the libraries
invisible(lapply(required_libraries, library, character.only = TRUE))

# Error handling for package loading
loaded_libraries <- sapply(required_libraries, require, character.only = TRUE)

if (any(!loaded_libraries)) {
  stop("Error: Some required libraries failed to load: ", 
    paste(names(loaded_libraries[!loaded_libraries]), collapse = ", "))
} else {
  message("All libraries loaded successfully.")
}


# Ensure that the system language is set to English.
# Set all locale settings to English.
Sys.setenv(LANG = "en")
Sys.setlocale("LC_ALL", "en_US.UTF-8")



### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# RUN CODE ----
### ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#
# Description:
# Perform the benchmarking with 3 number of runs with the cores running in serial.

res <- benchmark_std(runs = 3, verbose = TRUE, cores = 0L)
plot(res)

