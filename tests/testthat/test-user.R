context("user info")

test_that("can get steam64 id for user", {
  id = get_steam_id_64(STEAM_KEY, "earthr0t69")
  expect_equal(id, EARTHR0T69)
})