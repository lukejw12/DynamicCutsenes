execute store result score #total_cutscenes dynamic_cutscene.counter if entity @e[type=marker,tag=cutscene_point]

data remove storage dynamic_cutscene:menu found_cutscenes
data modify storage dynamic_cutscene:menu found_cutscenes set value []
scoreboard players set #cutscenes_found dynamic_cutscene.counter 0
execute as @e[type=marker,tag=cutscene_point] run function dynamic_cutscene:menu/extract_cutscene_tags

scoreboard players set #clear_index dynamic_cutscene.counter 0
function dynamic_cutscene:menu/clear_all_data_loop
kill @e[type=marker,tag=cutscene_point]

scoreboard players reset #marker_count dynamic_cutscene.counter
scoreboard players set @s dynamic_cutscene.menu_page 1
tellraw @s [{"text":"💥 CLEARED! ","color":"red","bold":true},{"text":"Deleted ","color":"yellow"},{"score":{"name":"#total_cutscenes","objective":"dynamic_cutscene.counter"},"color":"white"},{"text":" markers and all associated data.","color":"yellow"}]

function dynamic_cutscene:admin/admin_menu