library(shiny)

uiP1 <- tabPanel("Introduction")

uiP2 <- tabPanel("Chart 1")

uiP3 <- tabPanel("Chart 2")

uiP4 <- tabPanel("Chart 3",
                 sidebarLayout(
                   sidebarPanel(
                     
                   ),
                   mainPanel(
                     plotOutput('chart3'),
                   )
                 )
)


#uiP5

#uiP6 

muse_ui <- navbarPage("Project Muse",
  uiP1,
  uiP2,
  uiP3,
  uiP4,
)

