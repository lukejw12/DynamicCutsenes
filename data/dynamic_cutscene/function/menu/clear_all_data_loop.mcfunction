execute if score #clear_index dynamic_cutscene.counter >= #cutscenes_found dynamic_cutscene.counter run return 0

execute store result storage dynamic_cutscene:temp clear_index int 1 run scoreboard players get #clear_index dynamic_cutscene.counter
function dynamic_cutscene:menu/clear_single_cutscene_data with storage dynamic_cutscene:temp

scoreboard players add #clear_index dynamic_cutscene.counter 1
function dynamic_cutscene:menu/clear_all_data_loop