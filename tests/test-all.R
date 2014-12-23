library(testthat)
library(steamR)

context("credentials")

get_env <- function (var) {
  return (as.character(Sys.getenv(var)))
}

key <- function () {
  return (get_env("STEAM_KEY")) 
}

# globals
STEAM_KEY <- key()

# app id's
REBIRTH <- "250900"
STEAMWORLD <- "252410"

# steam64 id's
EARTHR0T69 <- "76561198067161637"

if (STEAM_KEY != "") {
  # only run tests if we have a valid STEAM_KEY
  test_check("steamR")
}