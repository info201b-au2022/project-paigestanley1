library("shiny")
library("stringr")
library("dplyr")
library("ggplot2")
library("plotly")
library("maps")
library("mapproj")


# Intro
spotify_dataset <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-paigestanley1/main/data/spotify_dataset.csv")
artists <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-paigestanley1/72f75295578fb13cc7ea28a48cbcd254daa4c095/data/top_artists.csv")
top_spotify_hits2000_2019 <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-paigestanley1/main/data/songs_normalize.csv")


num_countries <- length(unique(artists$country))

artist_country_freq <- names(which.max(table(artists$country)))

song_year_freq <- names(which.max(table(top_spotify_hits2000_2019$year)))

genre_freq <- names(which.max(table(top_spotify_hits2000_2019$genre)))

artist_freq <- names(which.max(table(spotify_dataset$Artist)))

max_followers <- names(which.max(table(spotify_dataset$Artist.Followers)))


#Chart 2
top_spotify_hits2000_2019 <- top_spotify_hits2000_2019 %>% filter(genre != "set()")
all_genres <- as.list(unique(unlist(strsplit(as.character(top_spotify_hits2000_2019$genre), ", "))))


#Chart 3
artists <- read.csv("https://media.githubusercontent.com/media/info201b-au2022/project-Chkjaer/main/data/top_artists.csv", stringsAsFactors = FALSE)
capitals <- read.csv("https://media.githubusercontent.com/media/info201b-au2022/project-Chkjaer/main/data/concap.csv")

capitals <- rename(capitals, country = CountryName)

top_artists <- artists %>%
  left_join(capitals, by = "country")

country_shape <- map_data("world")

#Server
muse_server <- function(input, output) {

#Chart 2
  output$chart2 <- renderPlot({
    wrangle_genre_data <- function(inputGenre) {
      data <- top_spotify_hits2000_2019 %>%
        filter(str_detect(genre, inputGenre)) %>%
        group_by(year) %>%
        summarise(total_popularity_of_genre = sum(popularity, na.rm = TRUE))
    }
    create_plot_for_genre <- function(inputGenre) {
      data <- wrangle_genre_data(inputGenre)
      ggplot(data, aes(x = year, y = total_popularity_of_genre)) + 
         geom_line(color = 'green') +
         labs(title = "Popularity of Genre from 2000 - 2019",
                  x = "Year",
                  y = "Total Popularity of Genre")
    }
    create_plot_for_genre(input$genre_selection)
  })

#Chart 3
  output$chart3 <- renderPlot({
    if(input$country != "World-wide") {
    top_artists <- top_artists %>% 
      filter(country == input$country)
    }
    top_artists <- top_artists %>% 
      head(input$topNum)
    
    world_map <- ggplot(country_shape) +
      geom_polygon(
        mapping = aes(x = long, y = lat, group = group),
        fill = "grey",
        color = "black",
        size = .01,
      ) +
      coord_map() +
      labs(
        title = paste0("Top ", input$topNum, " Spotify Artists' and their Home Countries' Capitals by Amount of Listeners"),
        x = NULL,
        y = NULL,
      )
      world_map <- world_map + 
        geom_point(
          data = top_artists,
          mapping = aes(x = CapitalLongitude, y = CapitalLatitude, size = listeners_lastfm),
          color = "green",
          alpha = .3
        ) + 
        labs(
          size = "Listeners"
        ) 
    world_map
  }) 
  output$artistsTable <- renderTable({
    if(input$country != "World-wide") {
      top_artists <- top_artists %>% 
        filter(country == input$country)
    }
    top_artists <- top_artists %>% 
      head(input$topNum) %>%
      summarise(
        Artist = artist_mb,
        Country = country,
        Genre = tags_lastfm,
        Listeners = listeners_lastfm,
        Scrobbles = scrobbles_lastfm
      )
    top_artists
  })
}

