#' Get complete app list
#'
#' Pull the complete app list. Each item contains the
#'   title and app ID of each program available in the 
#'   steam store. 
#'
#' @return the complete app list available in the steam
#'   store

get_app_list <- function() {
  raw_json = RCurl::getURI(STEAM_API_APP_LIST)
  app_list = RJSONIO::fromJSON(raw_json)$applist$apps
  return (app_list)
}