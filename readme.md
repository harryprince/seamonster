# RStudio Solution Engineering Demos

This repository contains demos and assets useful targetted at RStudio's Customer Success team and enterprise customers.

The master branch of this repository refreshes a shared project on our demo server nightly. New demos and WIP should be done on a branch of the project and submitted to master with PR. 

Assets and demos are arranged in a folder hiearchy: theme:feature:asset:asset_dependencies. There should not be deeper folder levels.

For example: an Rmd file that generates a stock report can be saved at rmarkdown:parameterized:stock_pdf.

Themes are defined by rstudio's website hiearchy. For example, flexdashboards are under rmarkdown.

Connect demos are located under their respective theme.