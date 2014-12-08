#' Get news for an app
#'
#' Get the latest news for an app.
#'
#' @export
#' @param app_id The app's AppID.
#' @param count The number of news entries to return. 
#'   Returns all news entries if unspecified.
#' @param max_length The maximum length of each news entry.
#'   Returns all characters if unspecified.
#'
#' @return The latest news of a game specified by its AppID.
#'
#' @section Returns:
#' Each item in the resulting list contains:
#' \describe{
#'   \item{gid}{The news entry's id}
#'   \item{title}{The news entry's title}
#'   \item{url}{The news entry's url}
#'   \item{author}{The news entry's author}
#'   \item{contents}{A shortened excerpt of the contents (to \code{max_length} characters), 
#'      terminated by "..." if longer than \code{max_length}.}
#'   \item{date}{A UNIX timestamp}
#' }
#'
#' @examples
#'
#' # get the most recent The Binding of Isaac: Rebirth news post
#' get_news_for_app(250900, count = 1)
#'
#' # get all SteamWorld Dig news posts
#' get_news_for_app(252410)
#'
#' @seealso \code{\link{get_app_list}} to get a list of app names & id's.

get_news_for_app <- function(app_id, count, max_length) {
  if (missing(count)) {
    count = ""
  } else {
    count = paste0(ARG_COUNT, count)
  }
  if (missing(max_length)) {
    max_length = ""
  } else {
    max_length = paste0(ARG_MAX_LENGTH, max_length)
  }
  args = paste0(ARG_APP_ID, app_id, count, max_length, ARG_FORMAT)
  url = paste0(STEAM_API_NEWS, args)
  json = get_json(url)
  return (json$appnews$newsitems)
}