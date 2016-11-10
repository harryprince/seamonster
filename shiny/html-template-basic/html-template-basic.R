library(shiny)
library(dygraphs)

ui <- htmlTemplate(filename = "index.html",
        my_htmlwidget = dygraphOutput("my_dygraph")
)

server <- function(input, output) {
  output$my_dygraph <- renderDygraph({
    lungDeaths <- cbind(mdeaths, fdeaths)
    dygraph(lungDeaths)
  })
}

shinyApp(ui = ui, server = server)