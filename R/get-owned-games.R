#' Get a User's Owned Games
#'
#' Returns a list of games a player owns along with some playtime information, 
#'   if the profile is publicly visible. Private, friends-only, 
#'   and other privacy settings are not supported. 
#'
#' @export
#' @param steam_key A Steam Web API Key.
#' @param steam64_id A 64-bit SteamID
#' @param include_appinfo Logical. Include game name and logo information in the output.
#' @param include_played_free_games Logical. By default, free games like Team Fortress 2 are excluded 
#'   If \code{include_played_free_games} is set to \code{TRUE}, they will be returned 
#'   if the player has played them at some point. 
#' @return A list of owned games
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
#'   \item{has_community_visible_stats}{Whether the program has stats accessible 
#'      via \code{\link{get_user_stats_for_game}}}
#' }

get_owned_games <- function(steam_key, steam64_id, include_appinfo = TRUE, include_played_free_games = FALSE) {
  if (include_appinfo) {
  	appinfo = paste0(ARG_INCLUDE_APP_INFO, 1)
  } else {
  	appinfo = paste0(ARG_INCLUDE_APP_INFO, 0)
  }
  if (include_played_free_games) {
  	freegames = paste0(ARG_INCLUDE_FREE_GAMES_INFO, 1)
  } else {
  	freegames = paste0(ARG_INCLUDE_FREE_GAMES_INFO, 0)
  }
  # NOTE: not including appids_filter param yet b/c not working
  # TODO: test this...
  args = paste0(ARG_KEY, steam_key, ARG_STEAM_ID, steam64_id, appinfo, freegames)
  url = paste0(STEAM_GET_OWNED_GAMES, args)
  json = get_json(url)
  return (json$response$games)
}