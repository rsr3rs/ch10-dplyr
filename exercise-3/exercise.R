# Exercise 3: using the pipe operator

# Install (if needed) and load the "dplyr" library
# install.packages("dplyr")
library("dplyr")

# Install (if needed) and load the "fueleconomy" package
# install.packages('devtools')
# devtools::install_github("hadley/fueleconomy")
library(fueleconomy)

# Which 2015 Acura model has the best hwy MGH? (Use dplyr, but without method
# chaining or pipes--use temporary variables!)
best_model <- select(
  filter(filter(
    vehicles, make == "Acura",
    year == 2015
  ), hwy == max(hwy)),
  model
)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr, nesting functions)
best_model <- select(filter(
  filter(vehicles, make == "Acura", year == 2015), hwy == max(hwy)
), model)

# Which 2015 Acura model has the best hwy MPG? (Use dplyr and the pipe operator)
best_model <- filter(vehicles, make == "Acura", year == 2015) %>%
  filter(hwy == max(hwy)) %>%
  select(model)


### Bonus

f1 <- function() {
  best_model <- select(
    filter(filter(
      vehicles, make == "Acura",
      year == 2015
    ), hwy == max(hwy)),
    model
  )
}

f2 <- function() {
  best_model <- select(filter(
    filter(vehicles, make == "Acura", year == 2015), hwy == max(hwy)
  ), model)
}

f3 <- function() {
  best_model <- filter(vehicles, make == "Acura", year == 2015) %>%
    filter(hwy == max(hwy)) %>%
    select(model)
}

system.time(for (i in 1:1000) f1())
system.time(for (i in 1:1000) f2())
system.time(for (i in 1:1000) f3())
