library(shiny)
library(leaflet)
library(tidyverse)
library(highcharter)

shinyUI(fluidPage(
  navbarPage("Access to Hospital Care", id="Nav",
             tabPanel("Map",
                      
                      leafletOutput("mymap", width="100%", height="700px"),
                      absolutePanel(id = "controls", class = "panel panel-default", 
                                    fixed = TRUE, draggable = TRUE, top = 100, 
                                    left = "auto", right = 20, bottom = "auto", 
                                    width = "200px", height = "auto", 
                                    h3("Options"),
                        checkboxInput("hospitals", "View Hospitals (Yellow)",value=TRUE),
                        checkboxInput("under", "View Underserved (Red)",value=TRUE),
                        checkboxInput("over", "View Overserved (Blue)",value=TRUE),
                        checkboxInput("range", "View In Range (Green)",value=FALSE)
                        
                      ),
                      p("This app uses county population and hospital data to determine the level of access to hospital care each county has. For more info please see the Model tab above"),
                      p("Source - Medicare & Census.gov")
               
             ),
             tabPanel("Model",
                      h3("Background and Model"),
                      p("This app uses county population and hospital data to determine the level of access to hospital care each county has"),
                      p("There was a high degree of correlation between the county's population and the number of hospitals. So we fitted a model to predict how many hospitals should be in a county"),
                      highchartOutput("model"),
             p("The results of the model where:

               - Residual standard error: 1.052 on 998 degrees of freedom
               
               - Multiple R-squared:  0.908
               
               - Adjusted ***R-squared:  0.9079***
               
               - F-statistic:  9851 on 1 and 998 DF
               
               - ***p-value: < 2.2e-16***
               
               And the formula was: 
               
               - lm(formula = hospitals ~ population, data = m_sample)"),
                      p("Source - Medicare & Census.gov")
             ))
))