## ----echo = TRUE---------------------------------------------------------
library(dygraphs)
dygraph(nhtemp, main = "eBay") %>% 
  dyRangeSelector(dateWindow = c("1920-01-01", "1960-01-01"))

## ------------------------------------------------------------------------
plot(mtcars)

## ---- message=FALSE, warning=FALSE, echo = FALSE-------------------------
library(leaflet)
cities <- read.csv("cities.csv")
leaflet(cities) %>% addTiles() %>%
  addCircles(lng = ~Long, lat = ~Lat, weight = 1,
    radius = ~sqrt(Pop) * 30, popup = ~City
  )

