library(shiny)
runApp("myapp")
data=iris

ui <- page_sidebar(
  title = "censusVis",
  sidebar = sidebar(
    helpText(
      "Select data from 3 species of iris."
    ),
    selectInput(
      "var",
      label = "Choose a variable to display",
      choices = c("Petal length",
                  "Petal width",
                  "Sepal length",
                  "Sepal width",
                  "Species"),
      selected = "Petal length"
    ),
    sliderInput(
      "range",
      label = "Range(cm):",
      min = 0, max = 10, value = c(0, 10)
    )
  ),
  textOutput("selected_var"),
  textOutput("min_max") 
)

server <- function(input, output) {
  
  output$selected_var <- renderText({
    paste("You have selected", input$var)
  })
  
  output$min_max <- renderText({
    paste("You have chosen a range that goes from",
          input$range[1], "to", input$range[2])
  })
  
}

shinyApp(ui, server)