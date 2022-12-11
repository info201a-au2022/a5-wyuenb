# A5 app.r

# Load libraries
library(shiny)
library(tidyverse)
library(plotly)
library(rsconnect)
library(shinyWidgets)

# Source the app_ui.r and app_server.r files
source("app_ui.r")
source("app_server.r")

# Create shinyApp
shinyApp(ui = ui, server = server)