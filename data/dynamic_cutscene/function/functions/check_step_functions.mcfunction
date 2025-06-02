$execute unless data storage dynamic_cutscene:functions $(cutscene_name) run return 0
$data modify storage dynamic_cutscene:temp current_step set value $(step)
$data modify storage dynamic_cutscene:temp current_cutscene set value "$(cutscene_name)"
$execute store result score #function_count dynamic_cutscene.counter run data get storage dynamic_cutscene:functions $(cutscene_name)
scoreboard players set #check_index dynamic_cutscene.counter 0

execute if score #function_count dynamic_cutscene.counter matches 1.. run function dynamic_cutscene:functions/check_function_loop