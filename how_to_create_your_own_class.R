##################################### Method 1 #####################################
x <- list(name = "John Snow", about = "He knows nothing!", rival = "White walkers")
class(x)
class(x) <- "person_summary"
class(x)

##################################### Method 2 #####################################
vroom <- function(name, hp, mpg, wt) {
  if(!is.character(name) || !is.numeric(hp) || !is.numeric(mpg) || !is.numeric(wt)) {
    stop("The name of the car must be a character and all other fields must be a number")
  }
  rating <- (hp * mpg) / wt
  object <- list(
    car_name = name, horse_power = hp, miles_per_gallon = mpg,
    weight = wt, rating = rating
  )
  attr(object, "class") <- "vroom"
  object
}
mazda <- vroom("Mazda RX4", 110, 21, "2.62")
mazda <- vroom("Mazda RX4", 110, 21, 2.62)
str(mazda)
mazda

print.vroom <- function(obj) {
  cat(
    "Summary of ", obj$car_name,
    "\n     Horse power:", obj$horse_power,
    "\nMiles per gallon:", obj$miles_per_gallon,
    "\n          Weight:", obj$weight,
    "\n          Rating:", obj$rating, "\n"
  )
}
print("some object other than vroom, in this case a string")
print(mazda)

some_calculation <- function(obj) {
  UseMethod("some_calculation")
}
some_calculation.default <- function(obj) {
  cat("`some_calculation` function only works for vroom object\n")
}
some_calculation.vroom <- function(obj) {
  numeric_values <- c(obj$horse_power, obj$miles_per_gallon, obj$weight)
  mean_value = mean(numeric_values)
  median_value = median(numeric_values)
  return(list(mean = mean_value, median = median_value))
}
one_calc_values <- some_calculation("some object other than vroom, in this case a string")
one_calc_values
one_calc_values <- some_calculation(mazda)
one_calc_values
