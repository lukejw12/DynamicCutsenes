scoreboard players add #marker_count dynamic_cutscene.counter 1
execute store result storage dynamic_cutscene:count count int 1 run scoreboard players get #marker_count dynamic_cutscene.counter
$execute at @s run summon marker ~ ~ ~ {Tags:["cutscene_point","$(cutscene_name)","interpolated"]}
execute as @e[type=marker,tag=cutscene_point,tag=interpolated,tag=!positioned,limit=1,sort=nearest] run tag @s add temp_particles
execute as @e[type=marker,tag=cutscene_point,tag=interpolated,tag=!positioned,limit=1,sort=nearest] run scoreboard players set @s dynamic_cutscene.particle_timer 150
function dynamic_cutscene:positions/apply_position_tag with storage dynamic_cutscene:count
execute as @e[type=marker,tag=cutscene_point,tag=!positioned,limit=1,sort=nearest] run data modify entity @s Rotation[0] set value 0.0f
execute as @e[type=marker,tag=cutscene_point,tag=!positioned,limit=1,sort=nearest] run data modify entity @s Rotation[1] set value 0.0f