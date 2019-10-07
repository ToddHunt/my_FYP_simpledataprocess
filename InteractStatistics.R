library(ggplot2)
library(tidyverse)
library(plotly)

apply_statistics <- read.csv("/Users/Todd/Desktop/Code Stock/R_FYP/ApplyStatistics.csv", header = TRUE, sep = ",")

#Plot 出一张交互图
inter_graph <- ggplot(apply_statistics, aes(x=Post_STAI_T, y=Present, color = Group.Type, shape = Group.Type)) + geom_point(size=4, alpha=0.9)
ggplotly(inter_graph)



#关于 State 和 Trait 前测后测

# State 和 Trait 的改变是否有协同性
STAI_State_Alleviate <- apply_statistics$Pre_STAI_S - apply_statistics$Post_STAI_S
STAI_Trait_Alleviate <- apply_statistics$Pre_STAI_T - apply_statistics$Post_STAI_T
ggplot( mapping = aes(x = STAI_State_Alleviate, y = STAI_Trait_Alleviate)) + geom_point(size = 2) +
  geom_smooth(method=lm , color="red", se=F)
cor(STAI_State_Alleviate, STAI_Trait_Alleviate)
# Print 以上的具体数字
cor(STAI_State_Alleviate, STAI_Trait_Alleviate)

cor(apply_statistics$Post_STAI_S, apply_statistics$Present)
cor(apply_statistics$Post_STAI_T, apply_statistics$Present)

# Lofi
lofi_Present <- c(60, 65, 88, 61, 53)
lofi_Post_State <- c(35, 43, 49, 40, 37)
lofi_Post_Trait <- c(39, 50, 47, 35, 31)
cor(lofi_Post_State, lofi_Present)
cor(lofi_Post_Trait, lofi_Present)

# High
high_Present <- c(34, 34, 79, 54, 69)
high_Post_State <- c(62, 47, 40, 35, 56)
high_Post_Trait <- c(57, 47, 41, 43, 44)
cor(high_Post_State, high_Present)
cor(high_Post_Trait, high_Present)
  
