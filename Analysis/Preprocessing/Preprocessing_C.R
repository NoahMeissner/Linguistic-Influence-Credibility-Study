library(tidyverse)
library(data.table)
library(dplyr)
library(stringr)
library(lubridate)
#######################
# ====  Read quantitative Data ====
#######################
#Imports
post_C <- read.csv("Data/post_C.csv")
pre_C <- read.csv("Data/pre_C.csv")

colnames(post_C)
#######################
# ====  Rename Columns ====
#######################

# Pre_C
pre_C <- pre_C %>% 
  rename(
    B_SignificanceSport = `Can.you.explain.the.significance.of.historical.sports.in.understanding.ancient.cultures.and.societies..If.you.re.unsure..please.type..No....Responses.can.be.given.in.either.German.or.English..`
  )
pre_C <- pre_C %>% 
  rename(
    B_InterestsHistory = `Do.you.have.an.interest.or.background.in.cultural.history..anthropology..or.related.fields.`
  )
pre_C <- pre_C %>% 
  rename(
    B_RelevantExtremeSport = `How.relevant.would.you.rate.the.role.of.extreme.sports.in.today.s.society.compared.to.historical.contexts.`
  )

# Post_C
post_C <- post_C %>% 
  rename(
    A_usefulText = `How.useful.did.you.find.the.text.in.providing.answers.` #
  )
post_C <- post_C %>% 
  rename(
    A_TextCredible = `Do.you.find.the.text.credible.`#
  )
post_C <- post_C %>% 
  rename(
    A_WhyCredible = `Explain.why.you.think.the.blog.article.is.credible...Responses.can.be.given.in.either.German.or.English..` #
  )
post_C <- post_C %>% 
  rename(
    A_Comprehensible = `How.comprehensible.did.you.find.the.blog.post.` #
  )
post_C <- post_C %>% 
  rename(
    A_Familar_Topic = `How.familiar.were.you.with.the.topic.before.reading.` #
  )
post_C <- post_C %>% 
  rename(
    A_Tewaarthon = `The.article.mentions.Tewaarathon..an.Iroquois.game.that.is.a.precursor.to.modern.lacrosse.`
  )
post_C <- post_C %>% 
  rename(
    A_Pasuckuakohowog = `The.text.discusses.Pasuckuakohowog..a.large.scale.team.game.played.by.the.Algonquin.people.`
  )
post_C <- post_C %>% 
  rename(
    A_Mayan_Ball = `The.text.highlights.the.Mayan.Ball.Game..emphasizing.its.ritualistic.aspects.and.its.role.in.the.social.and.cosmic.order.`
  )


merged_general <- inner_join(pre_C, post_C, by = "id")

write.csv(merged_general, "Modified/Topic_C.csv")
