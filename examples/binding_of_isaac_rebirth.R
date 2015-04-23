# get a user's Binding of Isaac: Rebirth achievements & missing achievements

rm(list = ls())

library(steamR)

STEAM_KEY = "FAKEKEY1234"
USER_ID = get_steam_id_64(STEAM_KEY, "earthr0t69")
REBIRTH_ID = 250900

rebirth_schema = get_schema_achievements(STEAM_KEY, REBIRTH_ID)
global_achv = get_global_achievement_percentages_for_app(REBIRTH_ID)
my_achv = get_player_achievements(STEAM_KEY, USER_ID, REBIRTH_ID)

# achievements relative to global
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
