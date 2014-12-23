context("user info")

test_that("can get steam64 id for user", {
  id = get_steam_id_64(STEAM_KEY, "earthr0t69")
  expect_equal(id, EARTHR0T69)
})

test_that("can get friend list for user", {
  list = get_friend_list(STEAM_KEY, EARTHR0T69, "all")
  expect_more_than(length(list), 0)
})

test_that("can get player achievements", {
  achievements = get_player_achievements(STEAM_KEY, EARTHR0T69, REBIRTH)
  expect_more_than(length(achievements), 0)
})

test_that("can get user stats for game", {
  stats = get_user_stats_for_game(STEAM_KEY, EARTHR0T69, REBIRTH)
  expect_more_than(length(stats), 0)
})
