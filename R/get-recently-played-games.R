#' Get Recently Played Games
#'
#' Returns returns a list of games a player has played 
#' in the last two weeks if the profile is publicly visible.
#'
#' @export
#' @param steam_key A Steam Web API Key.
#' @param steam64_id A 64-bit SteamID.
#' @param count The number of games to return. 
#'   Returns all games if unspecified.
#' @return A list of games a player has played in the last two weeks.
#'
#' @section Returns:
#' Each item in the resulting list contains:
#' \describe{
#'   \item{appid}{The unique identifier for the game}
#'   \item{name}{The name of the game}
#'   \item{playtime_2weeks}{The total number of minutes played in the last 2 weeks.}
#'   \item{playtime_forever}{The total number of minutes played on record, 
#'      since Steam began tracking total playtime in early 2009.}
#'   \item{img_icon_url}{The filename for the game's icon. 
#'      Accessible at \url{http://media.steampowered.com/steamcommunity/public/images/apps/APP_ID/IMG_ICON_URL.jpg}
#'      replacing \emph{APP_ID} and \emph{IMG_ICON_URL} as necessary.}
#'   \item{img_logo_url}{The filename for the game's logo.
#'      Accessible at \url{http://media.steampowered.com/steamcommunity/public/images/apps/APP_ID/IMG_LOGO_URL.jpg}
#'      replacing \emph{APP_ID} and \emph{IMG_LOGO_URL} as necessary.}
#' }
#' @section Steam Web API Key:
#' Get a Steam Web API Key at \url{http://steamcommunity.com/dev/apikey}
#'
#' @seealso \code{\link{get_user_stats_for_game}}

get_recently_played_games <- function(steam_key, steam64_id, count) {
  if (missing(count)) {
  	count = ""
  } else {
  	count = paste0(ARG_COUNT, count)
  }
  args = paste0(ARG_KEY, steam_key, ARG_STEAM_ID, steam64_id, count)
  url = paste0(STEAM_RECENTLY_PLAYED, args)
  json = get_json(url)
  return (json$response$games)
}