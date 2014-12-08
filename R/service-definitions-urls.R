#' Steam Web API service definition constants
#'
#' Service definition constants for Steam Web API.
#'
#' @name steam_api_service_definitions
#' @format a character string
#' @source \url{https://developer.valvesoftware.com/wiki/Steam_Web_API}
#' @seealso \code{\link{steam_api_args}} for service definition
#'   argument constants.
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

#' @export
#' @name steam_api_service_definitions
STEAM_API_PLAYER_SUMMARIES <- "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/"
