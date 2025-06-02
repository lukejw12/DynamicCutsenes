execute if score #display_index dynamic_cutscene.counter > #end_index dynamic_cutscene.counter run return 0

execute store result storage dynamic_cutscene:temp display_index int 1 run scoreboard players get #display_index dynamic_cutscene.counter
function dynamic_cutscene:menu/display_single_cutscene with storage dynamic_cutscene:temp

scoreboard players add #display_index dynamic_cutscene.counter 1
function dynamic_cutscene:menu/display_page_loop