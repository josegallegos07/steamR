#' Get news for an app
#'
#' Get the latest news for an app.
#'
#' @param app_id The AppID of the game.
#' @param count The number of news entries to return. 
#'   Returns all news entries if unspecified.
#' @param max_length The maximum length of each news entry.
#'   Returns all characters if unspecified.
#'
#' @return The latest news of a game specified by its AppID.
#'
#' Each item in the resulting list contains: a gid, a title, a url, 
#' a shortened excerpt of the contents (to \code{max_length} characters), 
#' terminated by "..." if longer than \code{max_length}, a feed label
#' a UNIX timestamp date, an author, and the feedname.
#'
#' @examples
#' # get the most recent Binding of Isaac: Rebirth news post
#' get_news_for_app(250900, count = 1)

get_news_for_app <- function(app_id, count, max_length) {
  if (missing(count)) {
    count = ""
  } else {
    count = paste(ARG_COUNT, count, sep = "")
  }
  if (missing(max_length)) {
    max_length = ""
  } else {
    max_length = paste(ARG_MAX_LENGTH, max_length, sep = "")
  }
  args = paste(ARG_APP_ID, app_id, count, max_length, ARG_FORMAT, sep = "")
  url = paste(STEAM_API_NEWS, args, sep= "")
  json = get_json(url)
  return (json$appnews$newsitems)
}