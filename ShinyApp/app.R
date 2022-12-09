library('rsconnect')
source('museApp_server.R')
source('museApp_ui.R')
library('shiny')

shinyApp(ui = muse_ui, server = muse_server)