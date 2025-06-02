scoreboard players add @s dynamic_cutscene.menu_page 1
scoreboard players operation #max_page dynamic_cutscene.counter = #cutscenes_found dynamic_cutscene.counter
scoreboard players set #cutscenes_per_page dynamic_cutscene.counter 5
scoreboard players add #max_page dynamic_cutscene.counter 4
scoreboard players operation #max_page dynamic_cutscene.counter /= #cutscenes_per_page dynamic_cutscene.counter
execute if score @s dynamic_cutscene.menu_page > #max_page dynamic_cutscene.counter run scoreboard players operation @s dynamic_cutscene.menu_page = #max_page dynamic_cutscene.counter
function dynamic_cutscene:admin_menu