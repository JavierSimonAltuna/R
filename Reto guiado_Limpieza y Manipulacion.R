install.packages("tidyverse")
library(dplyr)
library(lubridate)
library(rvest)
library(stringr)


url <- "https://en.wikipedia.org/wiki/Men%27s_high_jump_world_record_progression"
page <- read_html(url)
tablas <- html_table(html_elements(page, "table"))
raw <- as.data.frame(tablas[3])
summary(raw)

head(raw)

meters <- str_sub(raw$Mark,1,4)
head(meters)
class(meters)
meters <- as.numeric(meters)

country <- str_sub(raw$Athlete,-4,-2)
head (country)

atletas <- str_sub(raw$Athlete,1,-7)
head(atletas)

atletas <- str_to_upper(atletas)
head (atletas)

dates <- raw$Date
head(dates,n=5)
dates <- str_replace(dates, "\\[[1-9]\\]","")
class(dates)

dates <- dmy(dates)
dates

year <- year(dates)
head(year)

month <- month(dates)
head(month)

day <- day(dates)
head(day)

record_time_elapsed <- year(today())-year(dates)
head(record_time_elapsed)

clean_data <- data.frame("Record" = meters,
                        "Athlete" = atletas,
                        "Country" = country,
                        "Record Date" = dates,
                        "Record Year" = year,
                        "Record Month" = month,
                        "Record Day" = day,
                        "Record Time Elapsed" = record_time_elapsed,
                        "City" = raw$Venue
                        )
head(clean_data, n= 5)

info <- clean_data %>% mutate("Multiple Records" = ifelse(duplicated(Athlete), TRUE, FALSE)) %>% 
  select(Record, Athlete, Record.Year, "Multiple Records", Country)

info <- clean_data %>% select(Record, Athlete, Record.Year, Country)%>%
  filter (Record >= 2.30) %>% group_by(Country) %>%
  summarise("maxRecord" = max(Record),"N. of Records" =n()) %>% arrange(desc(maxRecord))

info

clean_data
