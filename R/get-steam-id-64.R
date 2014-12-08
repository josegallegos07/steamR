#' Get a 64-bit Steam ID
#'
#' @export
#' @param steam_key a Steam Web API Key. 
#'   Get a key at \url{http://steamcommunity.com/dev/apikey}
#' @param steam_id a Steam ID
#'
#' @return a 64-bit Steam ID

get_steam_id_64 <- function(steam_key, steam_id) {
  args = paste0(ARG_KEY, steam_key, ARG_VANITY_URL, steam_id)
  url = paste0(STEAM_RESOLVE_VANITY_URL, args)
  json = get_json(url)
  return(json$response$steamid)
}