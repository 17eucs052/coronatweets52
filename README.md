# coronatweets52

R Script that uses Twitter API and fetches tweets based on word "corona" and outputs top 10 tweets based on number of retweets to 
"retweets.json" if tweet is in English with screen_name and retweet_count, or "nonenglishtweets.json" if its other language with screen_name, created_at, hashtag.

Required Packages:
  rtweet,
  tidytext,
  dplyr,
  jsonlite,
  plumber.

Steps to execute:
  Install required packages ->
  Open app.R file in R Studio -> Change #To Gain TwitterAPIAccess Section values to your own values which can be obtained by requesting Twitter API Access from Twitter officially -> 
  Click on Run API ->
  The output files will be written on current path.
