library(tidyverse)
library(data.table)
library(dplyr)
library(stringr)
library(lubridate)


personal <- read.csv("Data/personal_data.csv")
time_data <- read.csv("Data/topic_timestamps.csv")
general_questions <- read.csv("Data/general.csv")
general_end <- read.csv("Data/general_end.csv")

#######################
# === Personal Data ===
#######################


#######################
# check Misspelling
#######################

personal <- personal %>%
  mutate(occupation = if_else(str_detect(occupation, regex("student", ignore_case = TRUE)), 
                              "Student", 
                              occupation))
write.csv(personal, "Modified/personal_data.csv")

#######################
# === Time Data ===
#######################


time_data <- time_data %>% 
  rename(
    id = `participant_id`
  )

write.csv(time_data, "Modified/time_data.csv")

