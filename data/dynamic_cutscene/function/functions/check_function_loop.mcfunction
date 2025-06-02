execute if score #check_index dynamic_cutscene.counter >= #function_count dynamic_cutscene.counter run return 0

execute store result storage dynamic_cutscene:temp check_index int 1 run scoreboard players get #check_index dynamic_cutscene.counter
function dynamic_cutscene:functions/check_single_function with storage dynamic_cutscene:temp

scoreboard players add #check_index dynamic_cutscene.counter 1
function dynamic_cutscene:functions/check_function_loop