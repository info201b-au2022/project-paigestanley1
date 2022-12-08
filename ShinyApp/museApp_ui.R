library(shiny)

uiP1 <- tabPanel("Introduction")

uiP2 <- tabPanel("Chart 1")

uiP3 <- tabPanel("Chart 2", 
                 sidebarLayout(
                   sidebarPanel(
                     selectInput("genre_selction", label="genre", choice = all_genres)),
                   mainPanel(
                     plotOutput("chart2")
                   )
                  )
                 )


uiP4 <- tabPanel("Chart 3",
                 sidebarLayout(
                   sidebarPanel(
                     #checkboxGroupInput("ratingType", label = h3("Show:"), 
                     #                   choices = list("Listens" = 1, "Scrobbles" = 2),
                     #                   selected = 1),
                     numericInput("topNum", 
                                  label = h3("How many artists do you want to see?"), 
                                  value = 1, 
                                  min = 0, 
                                  max = 10000),
                     
                       selectInput("country", "See top artists from which country?", choice = c("World-wide", unique(artists$country)))
                   ),
                   mainPanel(
                     plotOutput('chart3'),
                     tableOutput('artistsTable')
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

