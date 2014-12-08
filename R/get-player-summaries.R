#' Get Player Summaries
#'
#' Get basic profile information for a list of 64-bit Steam ID's.
#'
#' @export
#' @param steam_key a Steam Web API Key. 
#'   Get a key at \url{http://steamcommunity.com/dev/apikey}.
#' @param steam64_ids a vector of 64-bit Steam ID's.
#'   Up to 100 Steam IDs can be requested.
#'
#' @return Basic profile information for a list of Steam ID's.
#'
#' Some data associated with a Steam account may be hidden 
#' if the user has their profile visibility set to "Friends Only" 
#' or "Private". In that case, only public data will be returned.
#'
#' @section Returns:
#' Each item in the resulting list contains:
#'
#' \strong{Public Data:}
#' \describe{
#'   \item{steamid}{The user's 64-bit SteamID}
#'   \item{personaname}{The user's display name}
#'   \item{profileurl}{The full URL of the users's Steam Community profile}
#'   \item{avatar}{The full URL of the users's 32x32px avatar. 
#'      If the user hasn't configured an avatar, this will be the default ? avatar.}
#'   \item{avatarmedium}{The full URL of the users's 64x64px avatar. 
#'      If the user hasn't configured an avatar, this will be the default ? avatar.}
#'   \item{avatarfull}{The full URL of the users's 184x184px avatar. 
#'      If the user hasn't configured an avatar, this will be the default ? avatar.}
#'   \item{personastate}{The user's current status. 
#'      0 = Offline, 1 = Online, 2 = Busy, 3 = Away, 4 = Snooze, 5 = looking to trade, 6 = looking to play. 
#'      If the player's profile is private, this will always be 0}
#'   \item{communityvisibilitystate}{This represents whether the profile is visible or not, 
#'      and if it is visible, why you are allowed to see it.
#'      1 = the profile is not visible to you (private, friends only, etc.), 3 = the profile is public.}
#'   \item{profilestate}{1 = the user has a community profile configured, 0 = the user has not configured
#'      a community profile.}
#'   \item{lastlogoff}{A UNIX timestamp representing the last time the user was online.}
#'   \item{commentpermission}{If set, indicates the profile allows public comments.}
#' }
#'
#' \strong{Private Data:}
#' \describe{
#'   \item{realname}{If set, the user's real name}
#'   \item{primaryclanid}{The users's primary group, as configured in their Steam Community profile}
#'   \item{timecreated}{A UNIX timestamp representing the time the player's account was created.}
#'   \item{gameid}{If the user is currently in-game, this value will be return the gameid of that game.}
#'   \item{gameserverip}{The ip and port of the game server the user is currently playing on, if they are playing on-line in a game using Steam matchmaking. 
#'      Otherwise will be set to "0.0.0.0:0".}
#'   \item{gameextrainfo}{If the user is currently in-game, this will be the name of the game they are playing. 
#'      This may be the name of a non-Steam game shortcut.}
#'   \item{loccityid}{An internal code indicating the user's city of residence.}
#'   \item{loccountrycode}{If set in the user's Steam Community profile, the user's country of residence - a 2-character ISO country code.}
#'   \item{locstatecode}{If set in the user's Steam Community profile, the user's state of residence.}
#' }

get_player_summaries <- function(steam_key, steam64_ids = c()) {
  ids = paste(steam64_ids, sep = ",")
  args = paste0(ARG_KEY, steam_key, ARG_STEAM_IDS, ids)
  url = paste0(STEAM_API_PLAYER_SUMMARIES, args)
  json = get_json(url)
  return (json$response$players)
}