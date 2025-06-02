execute if score #cutscenes_found dynamic_cutscene.counter matches 0 run tellraw @s [{"text":"No cutscenes found!","color":"red"}]
execute if score #cutscenes_found dynamic_cutscene.counter matches 0 run return 0

scoreboard players set #cutscenes_per_page dynamic_cutscene.counter 5
scoreboard players operation #total_pages dynamic_cutscene.counter = #cutscenes_found dynamic_cutscene.counter
scoreboard players add #total_pages dynamic_cutscene.counter 4
scoreboard players operation #total_pages dynamic_cutscene.counter /= #cutscenes_per_page dynamic_cutscene.counter
scoreboard players operation #start_index dynamic_cutscene.counter = #current_page dynamic_cutscene.counter
scoreboard players remove #start_index dynamic_cutscene.counter 1
scoreboard players operation #start_index dynamic_cutscene.counter *= #cutscenes_per_page dynamic_cutscene.counter

scoreboard players operation #end_index dynamic_cutscene.counter = #start_index dynamic_cutscene.counter
scoreboard players operation #end_index dynamic_cutscene.counter += #cutscenes_per_page dynamic_cutscene.counter
scoreboard players remove #end_index dynamic_cutscene.counter 1

execute if score #end_index dynamic_cutscene.counter >= #cutscenes_found dynamic_cutscene.counter run scoreboard players operation #end_index dynamic_cutscene.counter = #cutscenes_found dynamic_cutscene.counter
execute if score #end_index dynamic_cutscene.counter >= #cutscenes_found dynamic_cutscene.counter run scoreboard players remove #end_index dynamic_cutscene.counter 1

execute if score #total_pages dynamic_cutscene.counter matches 2.. run tellraw @s [{"text":"Found cutscenes (Page ","color":"green"},{"score":{"name":"#current_page","objective":"dynamic_cutscene.counter"},"color":"yellow"},{"text":" of ","color":"green"},{"score":{"name":"#total_pages","objective":"dynamic_cutscene.counter"},"color":"yellow"},{"text":"):","color":"green"}]
execute if score #total_pages dynamic_cutscene.counter matches ..1 run tellraw @s [{"text":"Found cutscenes:","color":"green"}]

scoreboard players operation #display_index dynamic_cutscene.counter = #start_index dynamic_cutscene.counter
function dynamic_cutscene:menu/display_page_loop

function dynamic_cutscene:menu/show_navigation_buttons

execute if score #cutscenes_found dynamic_cutscene.counter matches 1.. run tellraw @s [{"text":"","color":"gray"}]
execute if score #cutscenes_found dynamic_cutscene.counter matches 1.. run tellraw @s [{"text":"🗑 Clear All Cutscenes","color":"red","bold":true,"click_event":{"action":"run_command","command":"/function dynamic_cutscene:menu/confirm_clear_all"},"hover_event":{"action":"show_text","value":"⚠ WARNING: This will delete ALL cutscenes!"}}]