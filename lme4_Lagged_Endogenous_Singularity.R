library(tidyverse)
library(lme4)

data<-tibble::tribble(
  ~ID, ~Time, ~Y1, ~X1, ~X2,
   1L,    0L,  1L,  2L,  3L,
   1L,    1L,  4L,  1L,  3L,
   1L,    2L,  4L,  5L,  2L,
   2L,    0L,  4L,  2L,  2L,
   2L,    1L,  5L,  5L,  1L,
   2L,    2L,  3L,  5L,  3L,
   3L,    0L,  5L,  1L,  4L,
   3L,    1L,  3L,  5L,  4L,
   3L,    2L,  3L,  3L,  5L,
   4L,    0L,  3L,  4L,  5L,
   4L,    1L,  3L,  1L,  5L,
   4L,    2L,  3L,  3L,  1L,
   5L,    0L,  3L,  1L,  4L,
   5L,    1L,  5L,  3L,  3L,
   5L,    2L,  2L,  1L,  1L,
   6L,    0L,  3L,  5L,  5L,
   6L,    1L,  4L,  5L,  1L,
   6L,    2L,  2L,  3L,  3L,
   7L,    0L,  4L,  4L,  5L,
   7L,    1L,  3L,  3L,  2L,
   7L,    2L,  1L,  5L,  2L,
   8L,    0L,  5L,  2L,  4L,
   8L,    1L,  4L,  2L,  2L,
   8L,    2L,  1L,  4L,  1L,
   9L,    0L,  5L,  4L,  3L,
   9L,    1L,  2L,  1L,  1L,
   9L,    2L,  3L,  3L,  2L,
  10L,    0L,  1L,  2L,  5L,
  10L,    1L,  4L,  4L,  3L,
  10L,    2L,  3L,  2L,  2L
  )


data<-data %>% 
   group_by(ID) %>%
   mutate(Y1_Lagged = lag(Y1))


data %>%
   lmer(Y1~Y1_Lagged+X1+X2+(1|ID), data=.) %>% summary()
