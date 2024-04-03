library(tidyverse)
library(data.table)
library(dplyr)
library(stringr)
library(lubridate)
#######################
# ====  Read quantitative Data ====
#######################
#Imports
post_A <- read.csv("Data/post_A.csv")
pre_A <- read.csv("Data/pre_A.csv")

colnames(post_A)
#######################
# ====  Rename Columns ====
#######################

# Pre_A
pre_A <- pre_A %>% 
  rename(
    B_neurodivergentExplain = `Can.you.explain.what.the.term..neurodivergent..means..If.you.re.unsure..please.type..No....Responses.can.be.given.in.either.German.or.English..`
  )
pre_A <- pre_A %>% 
  rename(
    B_studyPsycho = `Are.you.studying.psychology.or.a.related.field..or.have.an.interest.in.psychology.`
  )
pre_A <- pre_A %>% 
  rename(
    B_searchHealthInternet = `How.frequently.do.you.search.the.internet.for.health.symptoms.or.diagnoses.when.you.experience.health.issues.`
  )

# Post_A
post_A <- post_A %>% 
  rename(
    A_usefulText = `How.useful.did.you.find.the.text.in.providing.answers.`
  )
post_A <- post_A %>% 
  rename(
    A_TextCredible = `Do.you.find.the.text.credible.`
  )
post_A <- post_A %>% 
  rename(
    A_WhyCredible = `Explain.why.you.think.the.blog.article.is.credible...Responses.can.be.given.in.either.German.or.English..`
  )
post_A <- post_A %>% 
  rename(
    A_Comprehensible = `How.comprehensible.did.you.find.the.blog.post.`
  )
post_A <- post_A %>% 
  rename(
    A_Familar_Topic = `How.familiar.were.you.with.the.topic.before.reading.`
  )
post_A <- post_A %>% 
  rename(
    A_BrainTumor = `The.text.discusses.diagnosing.brain.tumours.`
  )
post_A <- post_A %>% 
  rename(
    A_MentalChallenging = `The.article.suggests.that.discussing.mental.health.is.challenging.for.many.`
  )
post_A <- post_A %>% 
  rename(
    A_identifyNeurodiverse = `It.is.mentioned.that.individuals.with.mental.illness.often.identify.as.neurodiverse.`
  )


merged_general <- inner_join(pre_A, post_A, by = "id")

write.csv(merged_general, "Modified/Topic_A.csv")
