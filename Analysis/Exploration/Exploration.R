library(ggpattern)
library(dplyr)

# Imports
time <- read.csv("Modified/time_data.csv")
personal_data <- read.csv("Modified/personal_data.csv")
general_questions <- read.csv("Modified/general.csv")

#######################
# === Task Time ===
#######################

print("First_Text")
time %>% 
  summarise(
    median_time_rounded = round(median(text_one/1000, na.rm = TRUE), 2),
    sd_time_rounded = round(sd(text_one/1000, na.rm = TRUE), 2),
    iqr_time_rounded = round(IQR(text_one/1000, na.rm = TRUE), 2)
  )

print("Second_Text")
time %>% 
  summarise(
    median_time_rounded = round(median(text_two/1000, na.rm = TRUE), 2),
    sd_time_rounded = round(sd(text_two/1000, na.rm = TRUE), 2),
    iqr_time_rounded = round(IQR(text_two/1000, na.rm = TRUE), 2)
  )

print("Third_Text")
time %>% 
  summarise(
    median_time_rounded = round(median(text_three/1000, na.rm = TRUE), 2),
    sd_time_rounded = round(sd(text_three/1000, na.rm = TRUE), 2),
    iqr_time_rounded = round(IQR(text_three/1000, na.rm = TRUE), 2)
  )

print("Fourth_Text")
time %>% 
  summarise(
    median_time_rounded = round(median(text_four/1000, na.rm = TRUE), 2),
    sd_time_rounded = round(sd(text_four/1000, na.rm = TRUE), 2),
    iqr_time_rounded = round(IQR(text_four/1000, na.rm = TRUE), 2)
  )

#######################
# === Demographics Distribution ===
#######################

# Distribution gender 
relative_distribution_gender <- prop.table(table(personal_data$gender))
print(relative_distribution_gender)


# Distribution occupation 
relative_distribution_occupation <- prop.table(table(personal_data$occupation))
print(relative_distribution_occupation)

# Distribution of educational level 
relative_distribution_level <- prop.table(table(personal_data$level))
print(relative_distribution_level)

# Distribution of age 
relative_distribution_age <- prop.table(table(personal_data$age))
print(relative_distribution_age)

print(range(personal$age))

print(median(personal$age))

#######################
# === Language Level ===
#######################

boxplot(general_questions$EnglishProficiency, general_questions$EnglishProficiencyEnd, names = c("Before", "After"), 
        main = "Comparison evaluation", 
        ylab = "evaluation",
        col = c("lightblue", "salmon"))

time %>% 
  summarise(
    median_proficiency_rounded = round(median(general_questions$EnglishProficiency, na.rm = TRUE), 2),
    sd_proficiency_rounded = round(sd(general_questions$EnglishProficiency, na.rm = TRUE), 2),
    iqr_proficiency_rounded = round(IQR(general_questions$EnglishProficiency, na.rm = TRUE), 2)
  )



result_pro <- t.test(as.integer(general_questions$EnglishProficiency), general_questions$EnglishProficiencyEnd, paired = TRUE)
result_pro <- wilcox.test(as.integer(general_questions$EnglishProficiency), general_questions$EnglishProficiencyEnd, paired = TRUE)

print(result_pro)

#######################
# === How often Blog Articles ===
#######################

relative_distribution_blog <- prop.table(table(general_questions$oftenRead))
print(relative_distribution_blog)

