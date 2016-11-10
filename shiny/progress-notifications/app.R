server <- function(input, output) {
  output$plot <- renderPlot({
    input$goPlot # Re-run when button is clicked
    
    # Create 0-row data frame which will be used to store data
    dat <- data.frame(x = numeric(0), y = numeric(0))
    
    withProgress(message = 'Main Message', value = 0, {
      # Number of times we'll go through the loop
      n <- 10
      
      for (i in 1:n) {
        # Each time through the loop, add another row of data. This is
        # a stand-in for a long-running computation.
        dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
        
        # Increment the progress bar, and update the detail text.
        incProgress(1/n, detail = paste("Detail Message", i))
        
        # Pause for 0.1 seconds to simulate a long computation.
        Sys.sleep(0.4)
      }
      showNotification("The plot is complete!", action = img(width = 50, height = 50, src = "https://cdn3.iconfinder.com/data/icons/business-vol-2-1/512/Like_Thumbs_Up-128.png"))
    })
    
    plot(dat$x, dat$y)
  })
}

ui <- shinyUI(basicPage(
  plotOutput('plot', width = "300px", height = "300px"),
  actionButton('goPlot', 'Re plot')
))

shinyApp(ui = ui, server = server)