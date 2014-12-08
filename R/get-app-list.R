#' Get the complete app list
#'
#' Gets the name and id of every program available in the 
#'   Steam store. 
#'
#' @export
#' @return A list containing the name and id of every program 
#'   available in the Steam store. 
#'
#' @section Returns:
#' Each item in the resulting list contains:
#' \describe{
#'   \item{appid}{The app's AppID}
#'   \item{name}{The app's name}
#' }

get_app_list <- function() {
  json = get_json(STEAM_API_APP_LIST)
  return (json$applist$apps)
}