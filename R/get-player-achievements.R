#' Get a Player's Achievements
#'
#' Returns a list of achievements for a user by AppID. 
#'
#' @export
#' @param steam_key a Steam Web API Key.
#' @param steam64_id A 64-bit SteamID to return friend list for.
#' @param app_id The app's AppID.
#' @return A list of achievements for a user by AppID.
#'
#' @section Returns:
#' Each item in the resulting list contains:
#' \describe{
#'   \item{apiname}{The API name of the achievement}
#'   \item{achieved}{Whether or not the achievement has been completed}
#' }
#' @section Steam Web API Key:
#' Get a Steam Web API Key at \url{http://steamcommunity.com/dev/apikey}
#'
#' @seealso \code{\link{get_user_stats_for_game}}

get_player_achievements <- function(steam_key, steam64_id, app_id) {
  # the appid argument not consistent with the static definition used in other methods
  args = paste0(ARG_KEY, steam_key, "&appid=", app_id, ARG_STEAM_ID, steam64_id)
  url = paste0(STEAM_FRIENDS_ACHIEVEMENTS, args)
  json = get_json(url)
  return (json$playerstats$achievements)
}

#' Get User Stats For Game.
#'
#' Returns a list of achievements for a user by AppID. 
#'
#' @export
#' @inheritParams get_player_achievements
#' @return A list of achievements for a user by AppID.
#'
#' @section Returns:
#' Each item in the resulting list contains:
#' \describe{
#'   \item{apiname}{The API name of the achievement}
#'   \item{achieved}{Whether or not the achievement has been completed}
#' }
#' @section Steam Web API Key:
#' Get a Steam Web API Key at \url{http://steamcommunity.com/dev/apikey}
#'
#' @seealso \code{\link{get_player_achievements}}

get_user_stats_for_game <- function(steam_key, steam64_id, app_id) {
  # the appid argument not consistent with the static definition used in other methods
  args = paste0(ARG_KEY, steam_key, "&appid=", app_id, ARG_STEAM_ID, steam64_id)
  url = paste0(STEAM_USER_STATS, args)
  json = get_json(url)
  return (json$playerstats$achievements)
}