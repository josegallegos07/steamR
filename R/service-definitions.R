#' Steam Web API service definition constants
#'
#' Service definition constants for Steam Web API
#'
#' @name steam_api_service_definitions
NULL

#' @export
#' @name steam_api_service_definitions
STEAM_API_APP_LIST <- "http://api.steampowered.com/ISteamApps/GetAppList/v2/"

#' @export
#' @name steam_api_service_definitions
STEAM_API_NEWS <- "http://api.steampowered.com/ISteamNews/GetNewsForApp/v0002/"

#' @export
#' @name steam_api_service_definitions
STEAM_API_GLOBAL_ACHIEVEMENT <- "http://api.steampowered.com/ISteamUserStats/GetGlobalAchievementPercentagesForApp/v0002/"

#' Steam Web API service definition argument constants
#'
#' Service definition argument constants for Steam Web API
#'
#' @name steam_api_args
NULL

#' @export
#' @name steam_api_args
ARG_APP_ID <- "?appid="

#' @export
#' @name steam_api_args
ARG_GAME_ID <- "?gameid="

#' @export
#' @name steam_api_args
ARG_MAX_LENGTH <- "&maxlength="

#' @export
#' @name steam_api_args
ARG_COUNT <- "&count="

#' @export
#' @name steam_api_args
ARG_FORMAT <- "&format=JSON"
