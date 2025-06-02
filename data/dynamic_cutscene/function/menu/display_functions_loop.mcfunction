execute if score #display_index dynamic_cutscene.counter >= #function_count dynamic_cutscene.counter run return 0

execute store result storage dynamic_cutscene:temp function_index int 1 run scoreboard players get #display_index dynamic_cutscene.counter
function dynamic_cutscene:menu/display_single_function with storage dynamic_cutscene:temp

scoreboard players add #display_index dynamic_cutscene.counter 1
function dynamic_cutscene:menu/display_functions_loop