execute as @e[type=marker,tag=temp_particles] at @s run particle minecraft:end_rod ~ ~ ~ 0 0 0 0 5 force @a
execute as @e[type=marker,tag=temp_particles] run scoreboard players remove @s dynamic_cutscene.particle_timer 1
execute as @e[type=marker,tag=temp_particles,scores={dynamic_cutscene.particle_timer=..0}] run tag @s remove temp_particles

execute unless entity @a[tag=spectating] run return 0

execute unless score #cutscene_active dynamic_cutscene.counter matches 1 run scoreboard players set #global_ticks dynamic_cutscene.counter 0
scoreboard players set #cutscene_active dynamic_cutscene.counter 1

scoreboard players add #global_ticks dynamic_cutscene.counter 1

scoreboard players operation #tick_mod dynamic_cutscene.counter = #global_ticks dynamic_cutscene.counter
scoreboard players operation #tick_mod dynamic_cutscene.counter %= #1 dynamic_cutscene.counter
execute as @a[tag=spectating] run function dynamic_cutscene:functions/check_player_cutscene

execute as @a[tag=spectating,gamemode=!spectator] run gamemode spectator @s
execute as @a[tag=spectating,gamemode=!spectator] run title @s actionbar [{"text":"You cannot leave the cutscene!","color":"red"}]
execute as @a[tag=spectating] run function dynamic_cutscene:functions/lock_to_cutscene