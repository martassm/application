library(shiny)

shinyServer(function(input, output) {
  
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
  
})