context("app info")

test_that("can get news for app", {
  news = get_news_for_app(REBIRTH)
  expect_more_than(length(news), 0)
})

test_that("can get global achievement percentages for app", {
  percentages = get_global_achievement_percentages_for_app(REBIRTH)
  expect_more_than(length(percentages), 0)
})

test_that("can get schema for app", {
  schema = get_schema_for_game(STEAM_KEY, REBIRTH)
  expect_more_than(length(schema), 0)
})

test_that("can get schema name for app", {
  schema_name = get_schema_name(STEAM_KEY, REBIRTH)
  expect_more_than(length(schema_name), 0)
})

test_that("can get schema version for app", {
  schema_version = get_schema_version(STEAM_KEY, REBIRTH)
  expect_more_than(length(schema_version), 0)
})

test_that("can get schema achievements for app", {
  schema_achievements = get_schema_achievements(STEAM_KEY, REBIRTH)
  expect_more_than(length(schema_achievements), 0)
})

test_that("can get schema stats for app", {
  schema_stats = get_schema_stats(STEAM_KEY, REBIRTH)
  expect_more_than(length(schema_stats), 0)
})