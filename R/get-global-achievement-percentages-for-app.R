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

get_global_achievement_percentages_for_app <- function(app_id) {
  args = paste(ARG_GAME_ID, app_id, ARG_FORMAT, sep = "")
  url = paste(STEAM_API_GLOBAL_ACHIEVEMENT, args, sep = "")
  json = get_json(url)
  return (json$achievementpercentages$achievements)
}