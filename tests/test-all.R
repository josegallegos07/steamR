library(testthat)
library(steamR)

context("credentials")

key <- function () {
  key = base64enc::base64decode(Sys.getenv("STEAM_KEY"))
  return (as.character(key)) 
}

test_that("can access key from travis", {
  expect_equal(nchar(key()), 32)
})

test_check("steamR")