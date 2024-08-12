library(shiny)

# Define UI for the dashboard
ui <- dashboardPage(  # Creates the main structure of the dashboard
  dashboardHeader(    # Adds a header to the dashboard
    title = "Wine Quality Predictor"
  ),
  dashboardSidebar(   # Adds a sidebar for navigation
    sidebarMenu(      # Creates a menu in the sidebar
      menuItem(       # Adds an item to the sidebar menu
        "Predict Quality", 
        tabName = "predict", 
        icon = icon("wine-glass")  # Adds an icon from Font Awesome
      )
    )
  ),
  dashboardBody(      # Defines the main body of the dashboard
    tabItems(         # Manages multiple tabs in the UI
      tabItem(        # Defines content for a specific tab
        tabName = "predict",
        fluidRow(     # Creates a fluid row to hold UI elements
          box(        # Creates a box to contain UI elements
            title = "Wine Specifications", 
            status = "primary", 
            solidHeader = TRUE, 
            collapsible = TRUE,
            width = 4,
            selectInput("model_choice", "Select Model", 
                        choices = c("Initial Model" = "initial_model", 
                                    "Intermediate Model" = "intermediate_model", 
                                    "Final Model" = "final_model")),
            selectInput("type", "Type:", choices = c("red", "white")),       # Dropdown for type
            selectInput("location", "Location:", choices = c("Texas", "California")), # Dropdown for location
            numericInput("fixed.acidity", "Fixed Acidity:", value = 7.4, min = 0, step = 0.1),          # User input
            numericInput("volatile.acidity", "Volatile Acidity:", value = 0.7, min = 0, step = 0.01),    # User input
            numericInput("citric.acid", "Citric Acid:", value = 0, min = 0, step = 0.01),                # User input
            numericInput("residual.sugar", "Residual Sugar:", value = 1.9, min = 0, step = 0.1),         # User input
            numericInput("chlorides", "Chlorides:", value = 0.076, min = 0, step = 0.001),               # User input
            numericInput("free.sulfur.dioxide", "Free Sulfur Dioxide:", value = 11, min = 0, step = 1),  # User input
            numericInput("total.sulfur.dioxide", "Total Sulfur Dioxide:", value = 34, min = 0, step = 1),# User input
            numericInput("density", "Density:", value = 0.9978, min = 0, step = 0.0001),                 # User input
            numericInput("pH", "pH:", value = 3.51, min = 0, step = 0.01),                               # User input
            numericInput("sulphates", "Sulphates:", value = 0.56, min = 0, step = 0.01),                 # User input
            numericInput("alcohol", "Alcohol (%):", value = 9.4, min = 0, step = 0.1),                   # User input
            actionButton("predict.btn", "Predict Quality", icon = icon("calculator"))                    # Button to trigger prediction
          ),
          box(        # Creates a box to display output
            title = "Predicted Quality", 
            status = "success", 
            solidHeader = TRUE, 
            collapsible = TRUE,
            width = 8,
            h3(       # Creates a level 3 header
              textOutput("prediction")  # Displays reactive text
            )
          )
        )
      )
    )
  )
)