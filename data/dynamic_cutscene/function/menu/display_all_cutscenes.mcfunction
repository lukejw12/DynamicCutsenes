execute if score #cutscenes_found dynamic_cutscene.counter matches 0 run tellraw @s [{"text":"No cutscenes found!","color":"red"}]
execute if score #cutscenes_found dynamic_cutscene.counter matches 1.. run tellraw @s [{"text":"Found cutscenes:","color":"green"}]
scoreboard players set #display_index dynamic_cutscene.counter 0
execute if score #cutscenes_found dynamic_cutscene.counter matches 1.. run function dynamic_cutscene:menu/display_cutscene_loop