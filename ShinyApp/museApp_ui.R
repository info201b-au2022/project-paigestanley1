library(shiny)

uiP1 <- tabPanel("Introduction")

uiP2 <- tabPanel("Chart 1")

uiP3 <- tabPanel("Chart 2")

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

uiP5 <- tabPanel("Summary Takeaways", 
                 titlePanel("Things to Take Away"),
                 mainPanel(
                   p("Through geographical exploration, the U.K. and the U.S. are clearly the home of the most popular artists on spotify. The top 14 artists on spotify, including big names like Radiohead, Coldplay, and Nirvana, all call either the U.S. or U.K home. "),
                   p("Through historical exploration of genres from 2000-2019, . Folk saw a rise and fall over the "),
                   p()
                 )
                            
                 )

uiP6 <- tabPanel("Report")

muse_ui <- navbarPage("Project Muse",
  uiP1,
  uiP2,
  uiP3,
  uiP4,
  uiP5,
  uiP6,
)

