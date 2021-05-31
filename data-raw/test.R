
library(tidyverse)
library(tonythemes)
pal <- palette_sliced(5)[c(1, 5)]
p <-
  mtcars %>%
  mutate(across(am, factor)) %>%
  ggplot() +
  aes(x = mpg, y = wt) +
  geom_point(aes(color = am), size = 5) +
  scale_color_manual(values = pal) +
  theme_tony()
p

p +
  annotate_nickwan(x = 30, y = 4, size = 0.2) +
  annotate_megrisdal(x = 25, y = 5, size = 0.2)
