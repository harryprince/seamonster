library(ggplot2)

ui <- pageWithSidebar(
  
  headerPanel = headerPanel("Modal Example"),
  
  sidebarPanel = sidebarPanel(
          h1("Model Inputs"),
          numericInput("smooth", "Smoothing Parameter", 0.5), 
          actionButton("help", "Help?")
        ),
  
  mainPanel = mainPanel(
          plotOutput("modelResults")
        )
)
  

server <- function(input, output) {
    
    output$modelResults <- renderPlot({
      ggplot(mtcars, aes(hp, mpg)) + 
        geom_point() +
        geom_smooth(span = input$smooth)
    })
    
    observeEvent(input$help, {
      showModal(modalDialog(
        title = "About",
        "Helpful information to explain the model inputs",
        easyClose = TRUE
      ))
    })
}

shinyApp(ui=ui, server=server)