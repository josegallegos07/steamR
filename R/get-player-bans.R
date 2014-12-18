#' Get Player Bans
#'
#' Returns Steam Community, VAC, and Economy ban statuses for a list of Steam ID's.
#'
#' @export
#' @param steam_key A Steam Web API Key.
#' @param steam64_ids A vector of 64-bit Steam ID's.
#' @return Steam Community, VAC, and Economy ban statuses for
#'   a list of Steam ID's.
#'
#' @section Returns:
#' Each item in the resulting list contains:
#' \describe{
#'   \item{SteamId}{The player's 64 bit ID.}
#'   \item{CommunityBanned}{Indicates whether or not the player is banned 
#'      from \href{http://steamcommunity.com/}{Steam Community}}
#'   \item{VACBanned}{Indicates whether or not the player has VAC bans on record.}
#'   \item{NumberOfVACBans}{Number of VAC bans}
#'   \item{DaysSinceLastBan}{Number of days since last ban}
#'   \item{EconomyBan}{The player's ban status in the economy. 
#'      If the player has no bans on record the string will be "none", 
#'      if the player is on probation it will say "probation", etc.}
#' }
#'
#' @section Steam Web API Key:
#' Get a Steam Web API Key at \url{http://steamcommunity.com/dev/apikey}

get_player_bans <- function(steam_key, steam64_ids = c()) {
  ids = gsub(" ", "", toString(steam64_ids))
  args = paste0(ARG_KEY, steam_key, ARG_STEAM_IDS, ids)
  url = paste0(STEAM_PLAYER_BANS, args)
  json = get_json(url)
  return (json$players)
}