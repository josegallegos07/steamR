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
REBIRTH <- "250900"
STEAMWORLD <- "252410"

test_that("can access key from travis", {
  expect_equal(nchar(key()), 32)
})

test_check("steamR")