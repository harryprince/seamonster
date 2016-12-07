params <- structure(list(symbol = "TSLA"), .Names = "symbol")

library(quantmod)
library(DT)
library(dygraphs)
library(forecast)
library(highcharter)

prices <- round(getSymbols(params$symbol, auto.assign = FALSE), 2)
close <- Cl(last(prices))
open <- Op(last(prices))

recent <- last(prices, n=90)
recent_nv <- recent[,-5]

highchart() %>% 
   hc_yAxis_multiples(
    list(title = list(text = NULL), height = "75%", top = "0%"),
    list(title = list(text = NULL), height = "15%", top = "80.5%", opposite = TRUE)
  ) %>%
  hc_add_series_ohlc(prices, yAxis=0, name= params$symbol) %>% 
  hc_add_series_xts(prices[,paste0(params$symbol,".Volume")], name="Volume", type="column", yAxis=1) %>% 
  hc_add_theme(hc_theme_economist())

df <- as.data.frame(recent)
df[,paste0(params$symbol, ".Volume")] <- df[,paste0(params$symbol, ".Volume")]/1000000 
datatable(df) %>% 
  formatCurrency(c(paste0(params$symbol, ".Open"), paste0(params$symbol, ".High"), paste0(params$symbol, ".Low"), paste0(params$symbol,".Close"),
                  paste0(params$symbol, ".Adjusted")), digits=2) %>% 
  formatRound(c(paste0(params$symbol, ".Volume")), digits=0)

m <- arima(recent[,1], c(3,1,1))
f <- forecast(m,7)

plot(forecast(m,7), main="")

