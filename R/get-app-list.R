#' Get complete app list
#'
#' Pull the complete app list. Each item contains the
#'   title and app ID of each program available in the 
#'   steam store. 
#'
#' @return the complete app list available in the steam
#'   store

get_app_list <- function() {
  json = get_json(STEAM_API_APP_LIST)
  return (json$applist$apps)
}