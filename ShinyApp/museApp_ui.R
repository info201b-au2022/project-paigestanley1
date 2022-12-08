library(shiny)

uiP1 <- tabPanel("Introduction",
  titlePanel("Music Behavior Around the World"),
  mainPanel(
    img(src="spotify_image.jpeg", align = "left"
        ),
  mainPanel(
    "Music is a universally enjoyed art that succeeds at bringing people together,
    creating shared experiences, and representing culture. Being that Spotify is 
    the most used music streaming service in the world, we chose to look into their 
    data because it would encompass the largest range of cultures to answer our main question: 
    How does culture impact listening behavior"),
  mainPanel(
    "To answer this question, we decided to look into 3 different aspects of music data:
    where Spotify's most popular artists are from, what genre's are the most popular, and
    how music popularity has changed through time. Here is a deeper look into each category"),
  mainPanel(
    "Popularity of genre's: This question looks into cultural differences and how that affects 
    the popularity of certain music in different regions. Music from a certain country may 
    be more popular across the globe than other countries. We plan to research more into why 
    that is by looking into the country’s culture and demographic. It will allow us to ask 
    why certain trends are occurring. We used a dataset titled spotify_data.csv to answer this
    question. The datset provided information on the songs with the most streams on Spotify and
    the correlating information including the artists, genre, how many stremas it got, etc."),
  mainPanel(
    "Music through time: Music that has been popular in the 2000’s is different from popular 
    music in the 2010’s. Genres such as K-Pop have grown and expanded outside of Asia in the 
    past decade. A large reason as to why this occurred is the advancement of the Internet and 
    its ability for people to easily access information from the other side of the world. How has
    this impacted listening patterns? To answer this question, we looked at a datset titled
    songs_normalize.csv. It has data on the music specifics of the most popular songs, their genres,
    the year they came out, and the artist who sang them."),
  mainPanel(
    "Popular artists' origin: In our culture in the US, the majority of top artists are originally 
    from the US. We are wondering if this is true worldwide or whether artists from other countries 
    are dominating the top charts as well. The dataset we used for this idea was titled artists.csv.
    It provided data on where the most popular artists are from, the amount of listeners they have, etc."),
  mainPanel(
    "Through this information we were able to find...")

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


#uiP5

#uiP6 

muse_ui <- navbarPage("Project Muse",
  uiP1,
  uiP2,
  uiP3,
  uiP4,
)

