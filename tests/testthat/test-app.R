context("app info")

test_that("can get news for app", {
  news = get_news_for_app(REBIRTH)
  expect_more_than(length(news), 0)
})