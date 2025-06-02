$execute as @e[type=marker,tag=cutscene_point,tag=$(cutscene_name),tag=positioned] run tag @s remove temp_from
scoreboard players set #highest_pos dynamic_cutscene.counter 0
$execute as @e[type=marker,tag=cutscene_point,tag=$(cutscene_name),tag=positioned,tag=!interpolated] run function dynamic_cutscene:find_position_number
$execute as @e[type=marker,tag=cutscene_point,tag=$(cutscene_name),tag=positioned,tag=!interpolated] if score @s dynamic_cutscene.temp_pos = #highest_pos dynamic_cutscene.counter run tag @s add interpolate_from
$execute at @s run summon marker ~ ~ ~ {Tags:["cutscene_point","$(cutscene_name)","interpolate_to","no_auto_position"]}
execute as @e[type=marker,tag=interpolate_to,limit=1,sort=nearest] run data modify entity @s Rotation set from entity @p Rotation
data modify storage dynamic_cutscene_temp amount set from storage dynamic_cutscene_interpolate amount
data modify storage dynamic_cutscene_temp mode set from storage dynamic_cutscene_interpolate mode
$data modify storage dynamic_cutscene_temp cutscene_name set value "$(cutscene_name)"
function dynamic_cutscene:create_interpolated_points with storage dynamic_cutscene_temp