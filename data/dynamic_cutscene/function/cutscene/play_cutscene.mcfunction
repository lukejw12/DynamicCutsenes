execute store result storage dynamic_cutscene:player original_gamemode int 1 run data get entity @s playerGameType

execute store result storage dynamic_cutscene:player pos_x double 1 run data get entity @s Pos[0]
execute store result storage dynamic_cutscene:player pos_y double 1 run data get entity @s Pos[1]
execute store result storage dynamic_cutscene:player pos_z double 1 run data get entity @s Pos[2]
execute store result storage dynamic_cutscene:player rot_y float 1 run data get entity @s Rotation[0]
execute store result storage dynamic_cutscene:player rot_x float 1 run data get entity @s Rotation[1]
scoreboard players set #global_ticks dynamic_cutscene.counter 0
scoreboard players set #cutscene_active dynamic_cutscene.counter 1
scoreboard players reset * dynamic_cutscene.executed
tag @s add spectating
$tag @s add watching_$(cutscene_name)
$data modify storage dynamic_cutscene:cutscene speed set value $(speed)
$data modify storage dynamic_cutscene:cutscene cutscene_name set value "$(cutscene_name)"

$execute as @e[type=marker,tag=position_1,tag=$(cutscene_name),limit=1] at @s run summon item_display ~ ~ ~ {Tags:["cutscene_camera","camera_$(cutscene_name)"],transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0f,0f,0f]}}

$execute as @e[type=item_display,tag=camera_$(cutscene_name)] run data modify entity @s Rotation set from entity @e[type=marker,tag=position_1,tag=$(cutscene_name),limit=1] Rotation
$execute as @e[type=item_display,tag=camera_$(cutscene_name)] run data modify entity @s teleport_duration set value $(speed)

gamemode spectator @s
$spectate @e[type=item_display,tag=camera_$(cutscene_name),limit=1] @s

scoreboard players set #cutscene_step dynamic_cutscene.counter 1
execute store result storage dynamic_cutscene:cutscene step int 1 run scoreboard players get #cutscene_step dynamic_cutscene.counter
function dynamic_cutscene:cutscene/tp_to_position with storage dynamic_cutscene:cutscene