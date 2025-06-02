execute as @e[type=marker] at @s run particle end_rod ~ ~ ~ 0 0 0 0 0 force @a 


execute unless entity @a[tag=spectating] run return 0

execute unless score #cutscene_active dynamic_cutscene.counter matches 1 run scoreboard players set #global_ticks dynamic_cutscene.counter 0
scoreboard players set #cutscene_active dynamic_cutscene.counter 1

scoreboard players add #global_ticks dynamic_cutscene.counter 1

scoreboard players operation #tick_mod dynamic_cutscene.counter = #global_ticks dynamic_cutscene.counter
scoreboard players operation #tick_mod dynamic_cutscene.counter %= #1 dynamic_cutscene.counter
execute as @a[tag=spectating] run function dynamic_cutscene:functions/check_player_cutscene