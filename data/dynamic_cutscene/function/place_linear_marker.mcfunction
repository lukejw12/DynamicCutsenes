execute store result score #distance dynamic_cutscene.counter run data get entity @e[type=marker,tag=interpolate_to,limit=1] Pos[0]
execute store result score #start_x dynamic_cutscene.counter run data get entity @s Pos[0]
scoreboard players operation #distance dynamic_cutscene.counter -= #start_x dynamic_cutscene.counter
$execute positioned ^ ^ ^$(t) run function dynamic_cutscene:spawn_interpolated_marker with storage dynamic_cutscene:count