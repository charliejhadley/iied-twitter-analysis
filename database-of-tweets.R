library(rtweet)
library(tidyverse)


# Tweets mentioning -------------------------------------------------------

# NEVER run this code again, this was used to create the original empty file
# read_rds("data/tweets_mention_iied.rds") %>%
#   slice(0) %>% 
#   write_csv("data/database_tweets-mention-iied.csv")

most_recent_tweets_mentioning_iied <- search_tweets(
  "IIED",    # the #hashtag or phrase you want to search
  n = 4000,              # number of tweets to capture
  type = "recent",       # recent | mixed | popular
  include_rts = FALSE,   # no retweets
  verbose = TRUE,
  retryonratelimit = FALSE,    # set to true if you want it to run again
  lang = "en"            # English language tweets
)

existing_database_tweets_mentioning_iied <- read_csv("data/database_tweets-mention-iied.csv")

# Update tweet mentioning data file
most_recent_tweets_mentioning_iied %>% 
  filter(!status_id %in% existing_database_tweets_mentioning_iied$status_id) %>% 
  write_csv("data/database_tweets-mention-iied.csv")


# Twitter timeline --------------------------------------------------------

# NEVER run this code again, this was used to create the original empty file
# read_rds("data/tweets_timeline_iied.rds") %>%
#   slice(0) %>%
#   write_csv("data/database_tweets_timeline_iied.csv")

most_recent_twitter_timeline_iied <- get_timeline(user = "IIED",
                                                  n = 3200)

existing_database_twitter_timeline_iied <- read_csv("data/database_tweets_timeline_iied.csv")

most_recent_twitter_timeline_iied %>% 
  filter(!status_id %in% existing_database_twitter_timeline_iied$status_id) %>% 
  write_csv("data/database_tweets_timeline_iied.csv")








