library(testthat)
library(steamR)

context("credentials")

test_that("can access key from travis", {

  key = Sys.getenv("STEAM_KEY")
  expect_equal(nchar(key), 32)

})

test_check("steamR")