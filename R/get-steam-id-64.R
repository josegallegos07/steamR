#' Get a 64-bit Steam ID
#'
#' @export
#' @param steam_key a Steam Web API Key.
#' @param steam_id a Steam ID
#'
#' @return a 64-bit Steam ID
#' @seealso \url{http://steamcommunity.com/dev/apikey} to get a Steam Web API Key.

get_steam_id_64 <- function(steam_key, steam_id) {
  args = paste0(ARG_KEY, steam_key, ARG_VANITY_URL, steam_id)
  url = paste0(STEAM_RESOLVE_VANITY_URL, args)
  json = get_json(url)
  return(json$response$steamid)
}