library(rtweet)
library(tidyverse)

accounts_followed_by_iied <- get_friends("iied", n = 7E4)

accounts_following_iied <- get_followers("iied", n = 7E4)

account_details_followed_by_iied <- lookup_users(accounts_followed_by_iied$user_id)

account_details_followed_by_iied %>% 
  write_csv("data/account_details_followed_by_iied.csv")

account_details_following_iied <- lookup_users(accounts_following_iied$user_id)

account_details_following_iied %>% 
  write_csv("data/account_details_following_iied.csv")