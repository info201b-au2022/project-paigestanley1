library('rsconnect')
source('museApp_ui.R')
source('museApp_server.R')

shinyApp(ui = muse_ui, server = muse_server)