library(testthat)
library(steamR)

STEAM_KEY <- Sys.getenv("STEAM_KEY")

nchar(STEAM_KEY)

test_check("steamR")