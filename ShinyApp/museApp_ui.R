library(shiny)

uiP1 <- tabPanel("Introduction",
  titlePanel("Music Behavior Around the World"),
  mainPanel(img(src="spotify_image.jpeg", align = "right")),
  mainPanel(
    p("Music is a universally enjoyed art that succeeds at bringing people together,
    creating shared experiences, and representing culture. Being that Spotify is 
    the most used music streaming service in the world, we chose to look into their 
    data because it would encompass the largest range of cultures to answer our main 
    question: How does culture impact listening behavior"),
  ),
  mainPanel(
    p("To answer this question, we decided to look into 2 different aspects of music data:
    where Spotify's most popular artists are from, and how music popularity has changed through time, specifically genres. Here is a deeper look into each category"),
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


uiP4 <- tabPanel("Summary Takeaways",
  titlePanel("Some things to take away"),
  mainPanel("Through geographical exploration, the U.K. and the U.S. are clearly the home of the most popular artists on spotify. The top 14 artists on spotify, including big nmes like Radiohead, Coldplay, Nirvana, all call either the U.S. or U.K. home"),
), 
  mainPanel("Through comparing the growth charts of each genre, it is clear that many genres reached their peaks in the 2000s, which strongly correlates to the culture at the time. R&B and rock reached their peak during the early to late 2000s and Hip Hop 
            and Dance/Electric music have grown since becoming popular in the early 2000s. Like these genre's, many other genre's reached their peak in the 2000s and 2010s, while in recent years, there is not one genre that is dominating. This could be due
            to the growth in availability to listen to music through streaming services like Spotify. There have also been some genre's that have made popularity comebacks in recent years after being popular in the early 2000s, which reflects the trends in
            other arts such as fashion.")

uiP5 <- tabPanel("Report",
        titlePanel("Report"),
        mainPanel(em("Findings:")),
        mainPanel("Answers to research questions:"),
        mainPanel("1. How have the most popular genre's changed over time?"),
        mainPanel("There were a couple of trends observed for each genre over the past two decades. Some notable
                  ones were that R&B reached its highest popularity in the early 2000s, rock in the late 2000s,
                  and pop in the early to mid 2010s.
                  Hip Hop grew significantly in the early 2000s and has stayed high since then. 
                  Metal was extremely popular in the early 2000s but dropped off since. 
                  Latin has inceased signficantly in the past five years. Before, it did not vary much.
                  The growth has been quite recent. Dance/Electronic has shown consistent growth since 2000.
                  It has been at its highest recently. Although acoustic was not very popular, it made the popularity list
                  consistently between 1999 and 2017. Apart from 2005, it showed consistency the popularity level.
                  There were a few genres that made the popularity list in some select years.
                  Jazz made it in 2003 and 2005. Classical made it in 2015. World/Traditional were listed 
                  between 2000 and 2010 and recently made it again in 2020. 
                  The same was true for easy listening (except it was 2017 instead of 2020). 
                  Blues made it in 1999, 2003, and 2007."),
        mainPanel("2. What are the majority of top artists' country-of-origin?"),
        mainPanel("The majority of top artists' country-of-origin are the United States 
                  and the United Kingdom. The top 14 Spotify artists are from the US and UK. The majority of
                  top artists are from English speaking bands, even if they originate from non-English speaking
                  countries. The majority of top artists are also in the form of majoity male rock bands. This shows 
                  the shared enjoyment of that kind of music."),
        mainPanel(em("Discussion")),
        mainPanel("Music is a large part of culture throughout the world, it represents
                  values, emotions, and can make political and societal statements. Music
                  has changed a lot over time, but the values of music hold true. It can bring
                  people together and divide people. Spotify has made music so acessible globally,
                  now people can stream music anywhere, anytime, and from any device. Spotify can
                  link different cultures together, therefore, providing data on the world's
                  listening habits. This data shows connections between cultures, shared listening habits,
                  and dominant cultures. This information can be insightful into cultural movements,
                  however, some may worry that their listening habits are being tracked by Spotify. Spotify 
                  tracks what you are listening to, when you are listening, where you are listening, who 
                  you follow, and all other interactions. Spotify's algorithm gives you suggestions
                  based on the data collected from you and because music can deeply impact our emotions,
                  Spotify can influence your moods. Spotify's algorithm can also influence you to only continue 
                  listening to your most popular genre and artists, instead of exposing you to new music. On the 
                  other hand, Spotify's algorith can also influence you for the better when giving you new music 
                  to try that you would not have listened to otherwise, connecting you to other cultures. Some 
                  limitations of our data is it does not. Going in to this project, an expected limitation, as
                  stated in P01, is that Spotify is also an app with a monthly subscription service where people 
                  from mostly middle class and up use so it will not be representative of people within the lower 
                  class. Tying into that, many people also use the free version of the app with ads and the inability 
                  to freely choose music (shuffle play). This will cause some outliers within the data because it is
                  likely for users to listen to songs they are not interested in due to them not being able to skip songs. 
                  Another limitation was that although Spotify is the largest music streaming service in the United States, 
                  it is not an exact representation of the entire world’s listening. Therefore, data from Spotify will 
                  not be 100% representative of the population’s listening behaviors, especially when it comes to countries 
                  outside of the U.S."),
        mainPanel(em("Conclusion")),
        mainPanel("Our desired expected implications, as stated in P01, was that the modern 
                  American pop music industry tends to shove certain artists into the spotlight and suppress many others. 
                  This power leaks to the rest of the world; cultures all around the globe have been found to listen to 
                  modern American music, possibly at the expense of their culture’s music and art. Hopefully bringing data 
                  like this to light can influence music platforms like Spotify to change their algorithms and give music 
                  from all over the opportunity to be successful. Our project is working to represent the rest of the world’s 
                  music and challenge the iron grip that the corporate machine of the American pop industry currently has. Our
                  findings prove that the American music industry and English music in general is dominating
                  the music industry, but our data also shows that people generally enjoy the same genre's of music. By
                  recommending music of similar genre's, but with different cultural identities, Spotify could successfully 
                  connect cultures together and build global connections through the shared joy of music. Spotify provides the gift
                  of connection, therefore, we should use it to the fullest to connect with people that we could never connect with
                  otherwise. Spotify also provides the opportunity for any artist, song, or genre of music to be explored. There are so many
                  small artists and niche genre's to be explored and you have the power to make them popular just by exploring their music.
                  Our action point for our audience is to dive into music from different cultures, spread your horizons
                  out of your comfort zone, and connect with people through music."),
)

muse_ui <- navbarPage("Project Muse",
  uiP1,
  uiP2,
  uiP3,
  uiP4,
  uiP5
)

