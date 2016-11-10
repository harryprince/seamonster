# Try: https://beta.rstudioconnect.com/content/1575/?_inputs_&grey=false&txt=%22rstudio.com%22

ui <- function(request) {
  fluidPage(
    textInput("txt", "Company Domain"),
    checkboxInput("grey", "Greyscale"),
    htmlOutput("img"),
    bookmarkButton()
  )
}
server <- function(input, output, session) {
  output$img <- renderText({
    if (!input$grey)
      paste('<img src="https://logo.clearbit.com/', input$txt, '">' ,sep="")
    else
      paste('<img src="https://logo.clearbit.com/', input$txt, '?greyscale=true">' ,sep="")
  })
}

enableBookmarking(store = "url")
shinyApp(ui, server)