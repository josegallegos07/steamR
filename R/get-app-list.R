#' Get complete app list
#'
#' Pull the complete app list. Each item contains the
#'   title and app ID of each program available in the 
#'   Steam store. 
#'
#' @export
#' @return The complete app list available in the Steam
#'   store.
#'
#' Each item in the resulting list contains the app's AppID
#'    and the app's name.

get_app_list <- function() {
  json = get_json(STEAM_API_APP_LIST)
  return (json$applist$apps)
}