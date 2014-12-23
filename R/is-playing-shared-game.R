#' Is Playing Shared Game
#'
#' Returns \code{TRUE} if a borrowing account is currently playing this game. 
#' Returns \code{FALSE} if the game is not borrowed or the borrower currently doesn't play this game.
#'
#' @export
#' @param steam_key A Steam Web API Key.
#' @param steam64_id A 64-bit SteamID.
#' @param app_id The app's AppID.
#' @return \code{TRUE} if a borrowing account is currently playing this game. 
#'   Returns \code{FALSE} if the game is not borrowed or the borrower currently doesn't play this game.

is_playing_shared_game <- function(steam_key, steam64_id, app_id) {
  args = paste0(ARG_KEY, steam_key, ARG_STEAM_ID, steam64_id, ARG_APP_ID_PLAYING, app_id)
  url = paste0(STEAM_IS_PLAYING_SHARED, args)
  json = get_json(url)
  resp = json$response
  if (resp == "0") {
    is_playing = FALSE
  } else {
    is_playing = TRUE
  }
  return (is_playing)
}