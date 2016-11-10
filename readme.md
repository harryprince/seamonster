# seamonster
**S**olutions **E**ngineering **A**ssets Monster

This repository contains demos and assets targetted at RStudio's Customer Success team and enterprise customers.

The master branch of this repository refreshes a shared project on our demo server nightly. New demos and WIP should be done on a branch of the project and submitted to master with PR. 

Demo Rules:

Assets and demos are arranged in a folder hiearchy: theme:feature:asset:asset_dependencies. There should not be deeper folder levels. This is to provide easy navigation for sales while on a demo. For example: Rmd files that generate stock report can be saved at rmarkdown:parameterized-stock:parameterized-stock-pdf.Rmd

Themes are defined by rstudio's website hiearchy. For example, flexdashboards are under rmarkdown.

Assets are named so that they can be easily found using rstudio's go-to file/function feature. The asset name should include the feature. For example, lm-gadet is an example of a shiny gadget. parameterized-stock-pdf is an example of a parameterized Rmd report having to do with stock prices.

For style consistency, everything is named in lowercase with dashes to separate words

Connect demos are located under their respective theme.
