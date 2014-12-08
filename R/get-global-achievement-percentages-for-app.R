#' Get Global Achievement Percentages for App
#'
#' Get the global achievement percentages for an app.
#'
#' @export
#' @param app_id The app's AppID.
#'
#' @return The latest global achievement percentages for an app.
#'
#' Each item in the resulting list contains the achievement name
#'    and the percentage.
#'
#' @examples
#'
#' # get global achievement percentages for Super Meat Boy
#' get_global_achievement_percentages_for_app(40800)
#'
#' @seealso \code{\link{get_app_list}} to get a list of app names & id's.

get_global_achievement_percentages_for_app <- function(app_id) {
  args = paste0(ARG_GAME_ID, app_id, ARG_FORMAT)
  url = paste0(STEAM_API_GLOBAL_ACHIEVEMENT, args)
  json = get_json(url)
  return (json$achievementpercentages$achievements)
}