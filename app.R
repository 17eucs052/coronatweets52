library(rtweet)
library(tidytext)
library(ggplot2)
library(dplyr)
library(jsonlite)
#library(plumber)

# api.R 
#* @get /coronatweets
coronatweets <- function(){
  
  #To gain TwitterAPIAccess
  appname <- "coronatweet52"
  key <- "zx7Mh8IzRXmMTRDheYEykbv6J"
  secret <- "zw2GH2q8mXda1a3B3PPcQInXVQS1lrNk9R3TKq4LJmNzeFZLHL"
  
  #Current Date
  todayDate = Sys.Date()
  
  #5 days before current date
  todayMinusFive = Sys.Date() - 5
  
  #Fetching tweets with word "corona" in 5 days
  tweets <- search_tweets(q = "corona", 
                          include_rts = TRUE,
                           since = todayMinusFive, until = todayDate )
  
  #Filtering Top 10 tweets according to number of retweets
  tweets <- tweets %>% 
    arrange(-retweet_count) %>%
    top_n(10)
  
  #Filtering English tweets in Top 10 tweets
  outputFile <- tweets %>% 
    arrange(-retweet_count) %>%
    top_n(10) %>% filter(lang=='en') %>%
    select(screen_name, retweet_count) 
  
  #Writing Top 10 English tweets according to no. of retweets to retweets.jason file
  write_json(outputFile , "retweets.json")
  
  #Filtering other language tweets in Top 10,if any
  otherLangTweets <- tweets %>% 
    arrange(-retweet_count) %>%
    top_n(10) %>% filter(lang != "en") %>%
    select(screen_name, created_at, hashtags) 
  
  #Writing Top 10 Other Language tweets according to no. of retweets to nonenglishtweets.json
  write_json(otherLangTweets , "nonenglishtweets.json")
  
  
  
}
