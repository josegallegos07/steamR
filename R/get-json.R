#' Get JSON from URL
#'
#' Get JSON-encoded data from a URL
#'
#' @param url a string giving the URL
#'
#' @return An R object created by mapping the JSON content 
#'   from the given URL to its R equivalent.

get_json <- function(url) {
  content = RCurl::getURI(url)
  json = RJSONIO::fromJSON(content)
  return (json)
}