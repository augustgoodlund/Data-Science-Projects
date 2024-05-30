library(shiny)
library(bslib)
library(ggplot2)
library(dplyr)
data=iris


ui <- page_sidebar(
  title = "Irises",
  "Choose Variables",
  sidebar = sidebar(
    position="right",
    card(helpText(
      "Look at me, I'm up here!"
    )),
    card(card_header("What flower do you like best?"),
         textInput("text", label = NULL, value = "Enter species..."),
         actionButton("action", label = "Submit")),
  ),
  selectInput(
    inputId = "y",
    label = "Y-axis",
    choices = c("Sepal.Length", "Sepal.Width",  "Petal.Length", "Petal.Width", "Species"),
    selected = "Petal.Width"
  ),
  selectInput(
    inputId = "x",
    label = "X-axis",
    choices = c("Sepal.Length", "Sepal.Width",  "Petal.Length", "Petal.Width", "Species"),
    selected = "Species"
  ),
  card(plotOutput(outputId = "scatterplot"))
)



  





server <- function(input, output, session) {
  output$scatterplot <- renderPlot({
    ggplot(data = iris, aes_string(x = input$x, y = input$y)) +
      geom_point()
  })
}

shinyApp(ui, server)