scoreboard players set @s dynamic_cutscene.menu_page 1
tellraw @s [{"text":"\n========== CUTSCENE ADMIN MENU ==========","color":"gold","bold":true}]
tellraw @s [{"text":"➕ Add New Cutscene","color":"green","bold":true,"click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:positions/set_position {cutscene_name:\"my_cutscene\",interpolate:\"none\"amount:0,}"},"hover_event":{"action":"show_text","value":"Click to get the command for creating a new cutscene point. Edit the cutscene name as needed."}}]
tellraw @s [{"text":"❓ Help & Commands","color":"blue","bold":true,"click_event":{"action":"run_command","command":"/function dynamic_cutscene:admin/help"},"hover_event":{"action":"show_text","value":"View all available commands and learn how to use the cutscene system"}}]
tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"Scanning for cutscenes...","color":"yellow"}]
data remove storage dynamic_cutscene:menu found_cutscenes
data modify storage dynamic_cutscene:menu found_cutscenes set value []
scoreboard players set #cutscenes_found dynamic_cutscene.counter 0
execute as @e[type=marker,tag=cutscene_point] run function dynamic_cutscene:menu/extract_cutscene_tags
function dynamic_cutscene:menu/display_paginated_cutscenes
tellraw @s [{"text":"=========================================","color":"gold","bold":true}]