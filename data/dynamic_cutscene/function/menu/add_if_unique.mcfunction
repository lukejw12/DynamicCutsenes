scoreboard players set #found_duplicate dynamic_cutscene.counter 0
function dynamic_cutscene:menu/check_for_duplicate with storage dynamic_cutscene:temp
execute if score #found_duplicate dynamic_cutscene.counter matches 0 run function dynamic_cutscene:menu/actually_add with storage dynamic_cutscene:temp