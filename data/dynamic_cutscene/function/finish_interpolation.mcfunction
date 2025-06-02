execute as @e[type=marker,tag=interpolate_to] run tag @s remove no_auto_position
scoreboard players add #marker_count dynamic_cutscene.counter 1
execute store result storage dynamic_cutscene:count count int 1 run scoreboard players get #marker_count dynamic_cutscene.counter
execute as @e[type=marker,tag=interpolate_to] run function dynamic_cutscene:positions/apply_position_tag with storage dynamic_cutscene:count
execute as @e[type=marker,tag=interpolate_to,tag=positioned] run tag @s add temp_particles
execute as @e[type=marker,tag=interpolate_to,tag=positioned] run scoreboard players set @s dynamic_cutscene.particle_timer 150
tag @e[type=marker,tag=interpolate_from] remove interpolate_from
tag @e[type=marker,tag=interpolate_to] remove interpolate_to