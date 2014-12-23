context("app info")

test_that("can get news for app", {
  news = get_news_for_app(REBIRTH)
  expect_more_than(length(news), 0)
})

test_that("can get global achievement percentages for app", {
  percentages = get_global_achievement_percentages_for_app(REBIRTH)
  expect_more_than(length(percentages), 0)
})