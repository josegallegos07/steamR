#' Get Player Summaries
#'
#' Get basic profile information for a list of 64-bit Steam ID's.
#'
#' @export
#' @param steam_key a Steam Web API Key. 
#'   Get a key at \url{http://steamcommunity.com/dev/apikey}
#' @param steam64_ids a vector of 64-bit Steam ID's.
#'   Up to 100 Steam IDs can be requested.
#'
#' @return Basic profile information for a list of Steam ID's.
#'
#' Some data associated with a Steam account may be hidden 
#' if the user has their profile visibility set to "Friends Only" 
#' or "Private". In that case, only public data will be returned.

get_player_summaries <- function(steam_key, steam64_ids = c()) {
  ids = paste(steam64_ids, sep = ",")
  args = paste0(ARG_KEY, steam_key, ARG_STEAM_IDS, ids)
  url = paste0(STEAM_API_PLAYER_SUMMARIES, args)
  json = get_json(url)
  return (json$response$players)
}