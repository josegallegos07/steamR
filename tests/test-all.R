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

test_that("can access key from travis", {
  expect_equal(nchar(STEAM_KEY), 32)
})

test_check("steamR")