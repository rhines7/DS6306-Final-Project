library(shiny)
library(ggplot2)
library(caret)

# Define server logic
server <- function(input, output) {
  
  selected_model <- reactive({
    req(input$model_choice)  # Ensure a model is selected
    model <- get(input$model_choice, envir = .GlobalEnv)
    
    # Debug: Print model type and structure
    print("Selected model:")
    print(str(model))
    
    model
  })
  
  # Observe event when Predict button is clicked
  observeEvent(               # Observes events (like button clicks)
    input$predict_btn, 
    {
      
      # Create a new data frame with the input values
      new_data <- data.frame(  # Creates a data frame
        fixed.acidity = input$fixed.acidity,
        volatile.acidity = input$volatile.acidity,
        citric.acid = input$citric.acid,
        residual.sugar = input$residual.sugar,
        chlorides = input$chlorides,
        free.sulfur.dioxide = input$free.sulfur.dioxide,
        total.sulfur.dioxide = input$total.sulfur.dioxide,
        density = input$density,
        pH = input$pH,
        sulphates = input$sulphates,
        alcohol = input$alcohol,
        type = input$type,
        location = input$location
      )
      
      # Debug: Print the new observation data
      print("New observation data:")
      print(new_observation)
      
      # Predict using the selected model
      model <- selected_model()
      predicted_quality <- predict(model, newdata = new_observation)  # No 'type' needed      
      
      # Debug: Print the prediction result
      print("Prediction result:")
      print(predicted_quality)
      
      # Display the predicted quality
      output$prediction <- renderText(  # Renders text in the UI
        {
          paste("The predicted quality of the wine is:", round(predicted_quality, 2))  # Concatenates strings; rounds numbers
        }
      )
    }
  )
}
