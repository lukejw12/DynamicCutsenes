tellraw @s [{"text":"\n========== CUTSCENE ADMIN MENU ==========","color":"gold","bold":true}]
tellraw @s [{"text":"Scanning for cutscenes...","color":"yellow"}]
data remove storage dynamic_cutscene:menu found_cutscenes
data modify storage dynamic_cutscene:menu found_cutscenes set value []
scoreboard players set #cutscenes_found dynamic_cutscene.counter 0
execute as @e[type=marker,tag=cutscene_point] run function dynamic_cutscene:menu/extract_cutscene_tags
function dynamic_cutscene:menu/display_all_cutscenes
tellraw @s [{"text":"=========================================","color":"gold","bold":true}]