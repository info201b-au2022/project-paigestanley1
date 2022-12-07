library("shiny")
library("dplyr")
library("ggplot2")
library("plotly")

#Chart 3
artists <- read.csv("https://media.githubusercontent.com/media/info201b-au2022/project-Chkjaer/main/data/top_artists.csv", stringsAsFactors = FALSE)
capitals <- read.csv("https://media.githubusercontent.com/media/info201b-au2022/project-Chkjaer/main/data/concap.csv")

top_artists <- artists %>% 
  arrange(-listeners_lastfm) %>%
  rename(country = country)
  
capitals <- rename(capitals, country = CountryName)

top_artists <- top_artists %>%
  left_join(capitals, by = "country")

country_shape <- map_data("world")

#Server
muse_server <- function(input, output) {
  
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
        title = paste0("Top ", input$topNum, " Spotify Artists' Home Countries by Capital with Amount of Listeners and/or Scrobbles"),
        x = NULL,
        y = NULL,
      )
    #if('1' %in% input$ratingType){
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
    #}
    #if('2' %in% input$ratingType){
    #world_map <- world_map +
    #  geom_point(
    #    data = top_artists,
    #    mapping = aes(x = CapitalLongitude, y = CapitalLatitude, size = scrobbles_lastfm),
    #    color = "purple",
    #    alpha = .3
    #  ) + 
    #  labs(
    #    size = "Scrobbles"
    #  )
    #}
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

