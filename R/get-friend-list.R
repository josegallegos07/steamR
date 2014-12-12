#' Get User's friend list
#'
#' Returns the friend list of a user, provided his or her
#'   Steam Community profile visibility is set to "Public". 
#'
#' @export
#' @param steam_key a Steam Web API Key.
#' @param steam64_id A 64-bit SteamID to return friend list for.
#' @param relationship Relationship filter. Possibles values: \code{all}, \code{friend}.
#' @return A user's friend list 
#'
#' @section Returns:
#' Each item in the resulting list contains:
#' \describe{
#'   \item{steamid}{The friend's 64-bit SteamID}
#'   \item{relationship}{The relationship qualifier}
#'   \item{friend_since}{UNIX timestamp representing the time 
#'      when the relationship was created}
#' }

get_friend_list <- function(steam_key, steam64_id, relationship) {
  valid <- c("all", "friend")
  if (!any(relationship == valid)) {
   stop("invalid relationship argument")
  }
  args = paste0(ARG_KEY, steam_key, ARG_STEAM_ID, steam64_id, ARG_RELATIONSHIP, relationship)
  url = paste0(STEAM_FRIENDS_LIST, args)
  json = get_json(url)
  return (json$friendslist$friends)
}