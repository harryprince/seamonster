library(shiny)
library(DBI)
library(pool)
library(dplyr)

pool <- dbPool(
  drv = RMySQL::MySQL(),
  dbname = "shinydemo",
  host = "shiny-demo.csa7qlmguqrf.us-east-1.rds.amazonaws.com",
  username = "guest",
  password = "guest"
)

ui <- fluidPage(
  textInput("ID", "Enter your ID:", "5"),
  tableOutput("tbl"),
  numericInput("nrows", "How many cities to show?", 10),
  plotOutput("popPlot")
)

server <- function(input, output, session) {
  output$tbl <- renderTable({
    src_pool(pool) %>% tbl("City") %>%
      filter(ID == input$ID)
  })
  output$popPlot <- renderPlot({
    df <- src_pool(pool) %>% tbl("City") %>%
      head(as.integer(input$nrows)[1]) %>% 
      collect()
    pop <- df$Population
    names(pop) <- df$Name
    barplot(pop)
  })
}

shinyApp(ui, server)