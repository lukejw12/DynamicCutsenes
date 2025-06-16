$execute positioned $(final_x) $(final_y) $(final_z) run summon marker ~ ~ ~ {Tags:["cutscene_point","$(cutscene_name)","interpolated","needs_rotation"]}

execute store result score #start_x dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data start_x 1000
execute store result score #start_y dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data start_y 1000
execute store result score #start_z dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data start_z 1000

execute store result score #end_x dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data end_x 1000
execute store result score #end_y dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data end_y 1000
execute store result score #end_z dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data end_z 1000

scoreboard players operation #center_x dynamic_cutscene.counter = #start_x dynamic_cutscene.counter
scoreboard players operation #center_x dynamic_cutscene.counter += #end_x dynamic_cutscene.counter
scoreboard players operation #center_x dynamic_cutscene.counter /= #2 dynamic_cutscene.counter

scoreboard players operation #center_y dynamic_cutscene.counter = #start_y dynamic_cutscene.counter
scoreboard players operation #center_y dynamic_cutscene.counter += #end_y dynamic_cutscene.counter
scoreboard players operation #center_y dynamic_cutscene.counter /= #2 dynamic_cutscene.counter

scoreboard players operation #center_z dynamic_cutscene.counter = #start_z dynamic_cutscene.counter
scoreboard players operation #center_z dynamic_cutscene.counter += #end_z dynamic_cutscene.counter
scoreboard players operation #center_z dynamic_cutscene.counter /= #2 dynamic_cutscene.counter

execute store result storage dynamic_cutscene:target x double 0.001 run scoreboard players get #center_x dynamic_cutscene.counter
execute store result storage dynamic_cutscene:target y double 0.001 run scoreboard players get #center_y dynamic_cutscene.counter
execute store result storage dynamic_cutscene:target z double 0.001 run scoreboard players get #center_z dynamic_cutscene.counter

function dynamic_cutscene:create_temp_target with storage dynamic_cutscene:target

execute as @e[type=marker,tag=needs_rotation,limit=1] at @s facing entity @e[type=marker,tag=temp_target,limit=1] eyes run tp @s ~ ~ ~ ~ ~

kill @e[type=marker,tag=temp_target]
tag @e[type=marker,tag=needs_rotation] remove needs_rotation
execute as @e[type=marker,tag=cutscene_point,tag=interpolated,tag=!positioned,limit=1,sort=nearest] run tag @s add temp_particles
execute as @e[type=marker,tag=cutscene_point,tag=interpolated,tag=!positioned,limit=1,sort=nearest] run scoreboard players set @s dynamic_cutscene.particle_timer 150