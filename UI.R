library(shiny)

ui <- fluidPage(
  titlePanel("Simple Weather Prediction"),
  
  p("Use the sliders to adjust temperature, humidity and cloud cover."),
  p("The application will automatically predict the weather condition based on your selection."),
  
  sidebarLayout(
    sidebarPanel(
      sliderInput("temp", "Temperature (°C):", min = -10, max = 40, value = 20),
      sliderInput("humidity", "Humidity (%):", min = 0, max = 100, value = 50),
      sliderInput("cloud", "Cloud Cover (%):", min = 0, max = 100, value = 30)
    ),
    
    mainPanel(
      textOutput("prediction")
    )
  )
)

server <- function(input, output) {
  
  output$prediction <- renderText({
    
    if (input$humidity > 80) {
      "Rainy 🌧️"
    } else if (input$cloud > 70) {
      "Cloudy ☁️"
    } else if (input$temp > 25) {
      "Sunny ☀️"
    } else {
      "Partly Cloudy ⛅"
    }
    
  })
}

# Important line
shinyApp(ui = ui, server = server)
