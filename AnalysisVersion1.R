apply_statistics <- read.csv("/Users/Todd/Desktop/Code Stock/R_FYP/ApplyStatistics.csv", header = TRUE, sep = ",")

library(hrbrthemes)
library(ggplot2)
library(tidyverse)
library(plotly)

apply_statistics

ggplot(apply_statistics, aes(x=Post_STAI_S, y=Present, color = Group.Type, shape = Group.Type)) + 
  geom_point(size = 2.5) +
  geom_text(label=(apply_statistics$Subject.Name), size = 2.5, vjust = 1.5)



# 使用Subset来提取有hifi或者lofi关键字的子集
hifi_subject <- subset(apply_statistics, Group.Type == "hi-fi")
lofi_subject <- subset(apply_statistics, Group.Type == "lo-fi")

t.test(apply_statistics$Pre_STAI_S, apply_statistics$Post_STAI_S)
t.test(apply_statistics$Pre_STAI_T, apply_statistics$Post_STAI_T)
#hifi
t.test(hifi_subject$Pre_STAI_S, hifi_subject$Post_STAI_S)
t.test(hifi_subject$Pre_STAI_T, hifi_subject$Post_STAI_T)
#lofi
t.test(lofi_subject$Pre_STAI_S, lofi_subject$Post_STAI_S)
t.test(lofi_subject$Pre_STAI_T, lofi_subject$Post_STAI_T)

# Presence and anxiety
#lofi
cor(lofi_subject$Post_STAI_S, lofi_subject$Present)
cor(lofi_subject$Post_STAI_T, lofi_subject$Present)

ggplot( mapping = aes(x = lofi_subject$Post_STAI_S, y = lofi_subject$Present)) + geom_point(size = 2) +
  geom_smooth(method=lm , color="red", se=F)


#hifi
cor(hifi_subject$Post_STAI_S, hifi_subject$Present)
cor(hifi_subject$Post_STAI_T, hifi_subject$Present)
ggplot( mapping = aes(x = hifi_subject$Post_STAI_S, y = hifi_subject$Present)) + geom_point(size = 2) +
  geom_smooth(method=lm , color="red", se=F)