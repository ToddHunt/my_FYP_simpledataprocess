apply_statistics <- read.csv("/Users/Todd/Desktop/Code Stock/R_FYP/ApplyStatistics.csv", header = TRUE, sep = ",")

# Libraries
library(tidyverse)
library(hrbrthemes)
library(viridis)
library(plotly)


# Plot
apply_statistics %>%
  ggplot( aes(x=Group.Type, y=Post_STAI_T)) +
  geom_boxplot() +
  scale_fill_viridis(discrete = TRUE) +
  theme(
    legend.position="none",
    plot.title = element_text(size=11)
  ) +
  ggtitle("Compare anxiety score in different fidelity situations") +
  xlab("")
