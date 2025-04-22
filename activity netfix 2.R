library(tidyverse)
library(lubridate)


netflix <- read_csv("netflix_titles.csv")

# 1.
nrow(netflix)

# 2.
netflix %>%
  count(type) %>%
  mutate(percentage = n / sum(n) * 100)

# 3. 
netflix %>%
  count(rating, sort = TRUE) %>%
  head(5)

# 4. 
sum(!complete.cases(netflix))
colSums(is.na(netflix)) %>% sort(decreasing = TRUE)

# 5. 
netflix %>%
  filter(!is.na(country)) %>%
  separate_rows(country, sep = ", ") %>%
  summarise(unique_countries = n_distinct(country))

