library("dplyr")
library("ggplot2")
library("plotly")

spotify_dataset <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-Chkjaer/main/data/spotify_dataset.csv")
artists <- here("~/Documents/info201/assignments/project-Chkjaer/data/artists.csv")
# This file will not open from our repository so I wrote the absolute path to it on my computer.
songs_normalize <- read.csv("https://raw.githubusercontent.com/info201b-au2022/project-Chkjaer/main/data/songs_normalize.csv")

artists_table <- artists %>%
  group_by(artist_mb) %>%
  select(artist_mb, country_mb, tags_mb, listeners_lastfm)

artists_table <- artists_table %>%
  rename(artist = artist_mb) %>%
  rename(genre = tags_mb) %>%
  rename(country_of_origin = country_mb) %>%
  rename(listeners = listeners_lastfm)

table <- left_join(artists_table, songs_normalize, by = "artist")

spotify_dataset <- spotify_dataset %>%
  rename(artist = Artist)

table_final <- left_join(table, spotify_dataset, by = "artist")

table_final <- table_final %>%
  select(artist, country_of_origin, listeners, popularity, song, year, genre.x, Artist.Followers)

table_final <- table_final[!duplicated(table_final$song), ]

table_final <- table_final %>%
  rename(genre = genre.x) %>%
  rename(artist_followers = Artist.Followers)

table_final <- table_final %>%
  select(artist, country_of_origin, listeners, song, year, genre, artist_followers)

table_final <- table_final[!duplicated(table_final$artist), ]




# This table shows aggregate data from all three of our charts. The table is grouped by 
# artist, wherin it shows the top Spotify artists, where they are from, their genre, the total
# amount of listeners they have on Spotify, the number of followers they have on Spotify, their
# songs that appear in the most popular songs on Spotify, and when each song came out. Through
# these colums, the table displays which genres are the most popular, which artists are the most
# popular and where they are from, as well as which songs are they most popular. It is clear 
# through the table that the most popular artists are from the US and UK and that the most popular genres
# are pop and rock. This table also answers are question that while Spotify is used worldwide,
# the majority of its popular music is from the US and UK. We wonder if this is because of Spotify's
# reccomendation algorithm or if English music is truly the most widely enjoyed. 
