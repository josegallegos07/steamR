# sample script showing my Binding of Isaac: Rebirth achievements relative to other players

rm(list = ls())

library(steamR)

STEAM_KEY = "GET_ONE!"
my_id = get_steam_id_64(STEAM_KEY, "earthr0t69")
rebirth_id = 250900

rebirth_schema = get_schema_achievements(STEAM_KEY, rebirth_id)
global_achv = get_global_achievement_percentages_for_app(rebirth_id)
my_achv = get_player_achievements(STEAM_KEY, my_id, rebirth_id)

# achievements to global
relative_achv = sapply(rebirth_schema, function(x) {
  return(unlist(c(x$name, x$displayName)))
})
relative_achv = as.data.frame(t(relative_achv))
names(relative_achv) = c("name", "displayName")
relative_achv$unlocked = sapply(my_achv, function (x) x$achieved)

global_dat = as.data.frame(do.call(rbind, global_achv))
global_dat$name = as.numeric(as.character(global_dat$name))
relative_achv = merge(relative_achv, global_dat, by = "name")

# missing achievements
missing_ach = relative_achv[relative_achv$unlocked == 0, ]
