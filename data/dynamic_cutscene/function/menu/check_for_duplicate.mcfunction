execute store result score #list_size dynamic_cutscene.counter run data get storage dynamic_cutscene:menu found_cutscenes
scoreboard players set #check_index dynamic_cutscene.counter 0
execute if score #list_size dynamic_cutscene.counter matches 1.. run function dynamic_cutscene:menu/duplicate_check_loop