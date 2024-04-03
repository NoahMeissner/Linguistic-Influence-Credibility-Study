library(tidyverse)
library(data.table)
library(dplyr)
library(stringr)
library(lubridate)
#######################
# ====  Read quantitative Data ====
#######################
#Imports
general_questions <- read.csv("Data/general.csv")
general_end <- read.csv("Data/general_end.csv")


#######################
# ====  Rename Columns ====
#######################

# General
general_questions <- general_questions %>% 
  rename(
    EnglishProficiency = `How.would.you.rate.your.proficiency.in.English.`
  )
general_questions <- general_questions %>% 
  rename(
    useEnglish = `Do.you.regularly.use.English.in.your.daily.life.`
  )
general_questions <- general_questions %>% 
  rename(
    nativeGerman = `Is.German.your.native.language.or.are.you.fluent.at.a.C1.level.`
  )
general_questions <- general_questions %>% 
  rename(
    oftenRead = `How.often.do.you.read.blog.articles...Choose.what.suits.you.best.`
  )

general_end <- general_end %>% 
  rename(
    EnglishProficiencyEnd = `How.would.you.rate.your.proficiency.in.English.`
  )

merged_general <- inner_join(general_questions, general_end, by = "id")

write.csv(merged_general, "Modified/general.csv")

