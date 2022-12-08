library(shiny)

uiP1 <- tabPanel("Introduction",
  titlePanel("Music Behavior Around the World"),
  mainPanel(img(src="spotify_image.jpeg", align = "left")),
  mainPanel(
    p("Music is a universally enjoyed art that succeeds at bringing people together,
    creating shared experiences, and representing culture. Being that Spotify is 
    the most used music streaming service in the world, we chose to look into their 
    data because it would encompass the largest range of cultures to answer our main 
    question: How does culture impact listening behavior"),
  ),
  mainPanel(
    p("To answer this question, we decided to look into 3 different aspects of music data:
    where Spotify's most popular artists are from, what genre's are the most popular, and
    how music popularity has changed through time. Here is a deeper look into each category"),
  ),
  mainPanel(
    p("Popularity of genre's: Spotify features thousands of different genre's that are shared
    between countries. The most popular genre on Spotify is", genre_freq, ". While this is the most encompassing genre, pop
    can mean different things in different countries. We used a dataset titled spotify_data.csv to answer this
    question. The datset provided information on the songs with the most streams on Spotify and
    the correlating information including the artist, genre, how many stremas it got, etc."),
  ),
  mainPanel(
    p("Music through time: Music that has been popular in the 2000’s is different from popular 
    music in the 2010’s.", song_year_freq, "was the year with the most songs that are in Spotify's 
    most streamed songs. The popularity of genre's has also changed over time. For example, K-Pop 
    has grown and expanded outside of Asia in the past decade. A large reason as to why this occurred 
    is the advancement of the Internet and its ability for people to easily access information from 
    the other side of the world. Now, artists can have millions of followers on Spotify reaching countries 
    all over the world. For example taylor Swift has", max_followers," To study this further, we looked at 
    a datset titled songs_normalize.csv. It has data on the music specifics of the most popular songs, their genres,
    the year they came out, and the artist who sang them."),
  ),
  mainPanel(
    p("Popular artists' origin: There are artists representing", num_countries, "throughout the world in 
    Spotify's top charts. In our culture in the US, the majority of top artists are originally 
    from the US. While the majority of Spotify's top artists are from the", artist_country_freq, "We are 
    wondering what other countries have top artists. The dataset we used for this idea was titled artists.csv.
    It provided data on where the most popular artists are from, the amount of listeners they have, etc.")),
  mainPanel(
    p("Enjoy our interactive visualizations!")
  ),
)

uiP2 <- tabPanel("Chart 2", 
                 sidebarLayout(
                   sidebarPanel(
                     selectInput("genre_selection", label="genre", choice = all_genres)),
                   mainPanel(
                     plotOutput("chart2")
                   )
                  )
                 )


uiP3 <- tabPanel("Chart 3",
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




uiP4 <- tabPanel("Report",
    titlePanel("Report"),
    mainPanel("Findings:"),
    mainPanel("Answers to research questions:"),
    mainPanel("1. What are the most popular genres on Spotify?"),
    mainPanel("The most popular genres on Spotify are Pop, Rap, KPop, and Hip Hop."),
    mainPanel("2. How have the most popular genre's changed over time?"),
    mainPanel(""),
    mainPanel("3. What are the majority of top artists' country-of-origin in countries 
              worldwide?"),
    mainPanel(""),
    mainPanel("2. How have the most popular genre's changed over time"),
)

uiP5 <- tabPanel("Summary Takeaways",
  titlePanel("Some things to take away"),
  mainPanel("Thorugh geographical exploration, the U.K. and the U.S. are clearly the home of the most popular artists on spotify. The top 14 artists on spotify, including big nmes like Radiohead, Coldplay, Nirvana, all call either the U.S. or U.K. home"),
)               

muse_ui <- navbarPage("Project Muse",
  uiP1,
  uiP2,
  uiP3,
  uiP4,
  uiP5,
)

