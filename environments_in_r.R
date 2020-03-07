ls()
ls(all.names = TRUE)
a <- 37
.hidden_a <- 73
.GlobalEnv$a
ls()
ls(all.names = TRUE)
my_new_environment <- new.env()
my_new_environment$a_inside_my_env <- "I cannot access a_inside_my_env directly!"
a_inside_my_env
assign(
  x = ".hidden_a", envir = my_new_environment,
  value = "I can also use assign, It can also be the same name as the global variable"
)
my_new_environment$.hidden_a
ls(my_new_environment, all.names = TRUE)
save.image("my_new_env.Rdata")
my_previous_env <- new.env()
load("my_new_env.Rdata", envir = my_previous_env)
ls(all.names = TRUE)
my_previous_env$my_new_environment$a_inside_my_env
my_previous_env$my_new_environment$a_inside_my_env <- "New value"
my_previous_env$my_new_environment$a_inside_my_env
rm(list = ls(my_previous_env, all.names = TRUE), envir = my_previous_env)
ls(my_previous_env, all.names = TRUE)
ls(all.names = TRUE)

