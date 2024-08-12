# app.R
library(shiny)
library(caret)
library(ggplot2)

# Initialize a flag to check if all models are loaded
all_models_loaded <- FALSE

# Function to load models and set the flag to TRUE if all models load successfully
load_model <- function(model_file) {
  tryCatch({
    load(model_file, envir = .GlobalEnv)
    message(paste("Successfully loaded:", model_file))
  }, error = function(e) {
    message(paste("Error loading:", model_file, "\n", e))
  })
}

# Load the models into the global environment
load_model("C:/Users/rhine/Desktop/SMU MSDS/DS 6306 - Doing Data Science/Project 2/Wine/wine_initial_model.RData")
load_model("C:/Users/rhine/Desktop/SMU MSDS/DS 6306 - Doing Data Science/Project 2/Wine/wine_intermediate_model.RData")
load_model("C:/Users/rhine/Desktop/SMU MSDS/DS 6306 - Doing Data Science/Project 2/Wine/wine_final_model.RData")

# Check if all models are present
if (exists("initial_model", envir = .GlobalEnv)) {
  all_models_loaded <- TRUE
}

# Only proceed if all models are successfully loaded
if (all_models_loaded) {
  # Source the UI and server components
  source("ui.R")
  source("server.R")
  
  # Run the application 
  shinyApp(ui = ui, server = server)
} else {
  stop("One or more models failed to load. The application will not start.")
}