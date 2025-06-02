data remove storage dynamic_cutscene:menu found_cutscenes
data modify storage dynamic_cutscene:menu found_cutscenes set value []
scoreboard players set #cutscenes_found dynamic_cutscene.counter 0
execute as @e[type=marker,tag=cutscene_point] run function dynamic_cutscene:menu/extract_cutscene_tags
scoreboard players set #cutscenes_per_page dynamic_cutscene.counter 5
scoreboard players operation #total_pages dynamic_cutscene.counter = #cutscenes_found dynamic_cutscene.counter
scoreboard players add #total_pages dynamic_cutscene.counter 4
scoreboard players operation #total_pages dynamic_cutscene.counter /= #cutscenes_per_page dynamic_cutscene.counter

execute if score #cutscenes_found dynamic_cutscene.counter matches 0 run scoreboard players set @s dynamic_cutscene.menu_page 1
execute if score #cutscenes_found dynamic_cutscene.counter matches 0 run return 0
execute if score @s dynamic_cutscene.menu_page > #total_pages dynamic_cutscene.counter run scoreboard players operation @s dynamic_cutscene.menu_page = #total_pages dynamic_cutscene.counter

execute if score @s dynamic_cutscene.menu_page matches ..0 run scoreboard players set @s dynamic_cutscene.menu_page 1