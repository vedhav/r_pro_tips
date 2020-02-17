library(tidyverse)
library(ggcharts)  # It's contains awesome collections of ggplot wrapper functions
data <- dplyr::starwars

# Without any pipe (You really woulden't wanna come back to this piece of code)
lollipop_chart(
  mutate(
    filter(
      summarise(
        group_by(
          data, species
        ),
        avg_height = mean(height), avg_mass = mean(mass)
      ),
      !is.na(avg_height) & !is.na(avg_mass)
    ),
    avg_bmi = avg_mass/(avg_height * 0.01)^2
  ),
  x = species, y = avg_bmi
) + ggtitle("Now that's what I call significantly more than others!")

# With some pipes (You could write this code faster than you could read the former)
# It is clearly understood that the data is grouped by species and passed,
# Then the mean height and weight of the grouped variables are added as columns
# Then we only retain cases where we have both the avg_height and avg_mass using filter
# We then add a new column where we calculate the bmi using the average metrics
# Finally we pass that data inside a plot function to get the graph we desire!
data %>% group_by(species) %>%
  summarise(avg_height = mean(height), avg_mass = mean(mass)) %>%
  filter(!is.na(avg_height) & !is.na(avg_mass)) %>%
  mutate(avg_bmi = avg_mass/(avg_height * 0.01)^2) %>%
  lollipop_chart(x = species, y = avg_bmi) +
  ggtitle("Now that's what I call significantly more than others!")

