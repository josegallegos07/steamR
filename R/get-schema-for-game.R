#' Get Schema for Game
#'
#' Returns the Game's schema (name, version, available achivements & stats).
#'
#' This is a wrapper for:
#'
#' \code{\link{get_schema_name}}
#'
#' \code{\link{get_schema_version}}
#'
#' \code{\link{get_schema_achievements}}
#'
#' \code{\link{get_schema_stats}}
#'
#' @export
#' @param steam_key A Steam Web API Key.
#' @param app_id The app's AppID.
#' @return The game's schema (name, version, available achivements & stats)
#'
#' @section Steam Web API Key:
#' Get a Steam Web API Key at \url{http://steamcommunity.com/dev/apikey}
#'
#' @seealso \code{\link{get_schema_name}}, \code{\link{get_schema_version}}, 
#'   \code{\link{get_schema_achievements}}, \code{\link{get_schema_stats}}

get_schema_for_game <- function(steam_key, app_id) {
  args = paste0(ARG_KEY, steam_key, "&appid=", app_id)
  url = paste0(STEAM_GAME_SCHEMA, args)
  json = get_json(url)
  return (json$game)
}

#' Get Game's Name
#'
#' Returns the game's name.
#'
#' @export
#' @inheritParams get_schema_for_game
#' @return The game's name
#'
#' @section Steam Web API Key:
#' Get a Steam Web API Key at \url{http://steamcommunity.com/dev/apikey}
#'
#' @seealso \code{\link{get_schema_for_game}}, \code{\link{get_schema_version}}, 
#'   \code{\link{get_schema_achievements}}, \code{\link{get_schema_stats}}

get_schema_name <- function(steam_key, app_id) {
  schema = get_schema_for_game(steam_key, app_id)
  return (schema$gameName)
}

#' Get Game's Version Number
#'
#' Returns The game's version number.
#'
#' @export
#' @inheritParams get_schema_for_game
#' @return The game's version number
#'
#' @section Steam Web API Key:
#' Get a Steam Web API Key at \url{http://steamcommunity.com/dev/apikey}
#'
#' @seealso \code{\link{get_schema_for_game}}, \code{\link{get_schema_name}}, 
#'   \code{\link{get_schema_achievements}}, \code{\link{get_schema_stats}}

get_schema_version <- function(steam_key, app_id) {
  schema = get_schema_for_game(steam_key, app_id)
  return (schema$gameVersion)
}

#' Get Game's Achievements
#'
#' Returns a list of achivements available in a game.
#'
#' @export
#' @inheritParams get_schema_for_game
#' @return A list of achievements available in a game.
#'
#' @section Returns:
#' Each item in the resulting list contains:
#' \describe{
#'   \item{name}{The name}
#'   \item{defaultvalue}{The default value}
#'   \item{displayName}{The display name}
#'   \item{hidden}{"0" if the achievement is hidden}
#'   \item{description}{A description}
#'   \item{icon}{The url for the achievement's "unlocked" image}
#'   \item{icongray}{The url for the achievement's "locked" image}
#' }
#'
#' @section Steam Web API Key:
#' Get a Steam Web API Key at \url{http://steamcommunity.com/dev/apikey}
#'
#' @seealso \code{\link{get_schema_for_game}}, \code{\link{get_schema_name}}, 
#'   \code{\link{get_schema_version}}, \code{\link{get_schema_stats}}

get_schema_achievements <- function(steam_key, app_id) {
  schema = get_schema_for_game(steam_key, app_id)
  return (schema$availableGameStats$achievements)
}

#' Get Game Achivement Stats
#'
#' Returns a list of achivement stats in a game.
#'
#' @export
#' @inheritParams get_schema_for_game
#' @return A list of achivement stats in a game.
#'
#' @section Returns:
#' Each item in the resulting list contains:
#' \describe{
#'   \item{name}{The name}
#'   \item{defaultvalue}{The default value}
#'   \item{displayName}{The display name}
#' }
#'
#' @section Steam Web API Key:
#' Get a Steam Web API Key at \url{http://steamcommunity.com/dev/apikey}
#'
#' @seealso \code{\link{get_schema_for_game}}, \code{\link{get_schema_name}}, 
#'   \code{\link{get_schema_version}}, \code{\link{get_schema_achievements}}

get_schema_stats <- function(steam_key, app_id) {
  schema = get_schema_for_game(steam_key, app_id)
  return (schema$availableGameStats$stats)
}
