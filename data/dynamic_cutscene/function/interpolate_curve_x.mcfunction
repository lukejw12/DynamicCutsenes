execute unless entity @e[type=marker,tag=interpolate_from] run return 0
execute unless entity @e[type=marker,tag=interpolate_to] run return 0
scoreboard players operation #next_position dynamic_cutscene.counter = #marker_count dynamic_cutscene.counter
scoreboard players add #next_position dynamic_cutscene.counter 1
execute store result storage dynamic_cutscene:count count int 1 run scoreboard players get #next_position dynamic_cutscene.counter
scoreboard players add #marker_count dynamic_cutscene.counter 1

$data modify storage dynamic_cutscene:count cutscene_name set value "$(cutscene_name)"
execute as @e[type=marker,tag=interpolate_from] run function dynamic_cutscene:store_start_data
execute as @e[type=marker,tag=interpolate_to] run function dynamic_cutscene:store_end_data
execute store result score #start_x dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data start_x 1000
execute store result score #start_y dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data start_y 1000
execute store result score #start_z dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data start_z 1000

execute store result score #end_x dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data end_x 1000
execute store result score #end_y dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data end_y 1000
execute store result score #end_z dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data end_z 1000
scoreboard players operation #diff_x dynamic_cutscene.counter = #end_x dynamic_cutscene.counter
scoreboard players operation #diff_x dynamic_cutscene.counter -= #start_x dynamic_cutscene.counter

scoreboard players operation #diff_y dynamic_cutscene.counter = #end_y dynamic_cutscene.counter
scoreboard players operation #diff_y dynamic_cutscene.counter -= #start_y dynamic_cutscene.counter

scoreboard players operation #diff_z dynamic_cutscene.counter = #end_z dynamic_cutscene.counter
scoreboard players operation #diff_z dynamic_cutscene.counter -= #start_z dynamic_cutscene.counter

execute store result score #t_scaled dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data t 1000

scoreboard players operation #diff_x dynamic_cutscene.counter *= #t_scaled dynamic_cutscene.counter
scoreboard players operation #diff_x dynamic_cutscene.counter /= #1000 dynamic_cutscene.counter

scoreboard players operation #diff_y dynamic_cutscene.counter *= #t_scaled dynamic_cutscene.counter
scoreboard players operation #diff_y dynamic_cutscene.counter /= #1000 dynamic_cutscene.counter

scoreboard players operation #diff_z dynamic_cutscene.counter *= #t_scaled dynamic_cutscene.counter
scoreboard players operation #diff_z dynamic_cutscene.counter /= #1000 dynamic_cutscene.counter

scoreboard players operation #final_x dynamic_cutscene.counter = #start_x dynamic_cutscene.counter
scoreboard players operation #final_x dynamic_cutscene.counter += #diff_x dynamic_cutscene.counter

scoreboard players operation #final_y dynamic_cutscene.counter = #start_y dynamic_cutscene.counter
scoreboard players operation #final_y dynamic_cutscene.counter += #diff_y dynamic_cutscene.counter

scoreboard players operation #final_z dynamic_cutscene.counter = #start_z dynamic_cutscene.counter
scoreboard players operation #final_z dynamic_cutscene.counter += #diff_z dynamic_cutscene.counter

scoreboard players set #1000 dynamic_cutscene.counter 1000
scoreboard players operation #curve_calc dynamic_cutscene.counter = #1000 dynamic_cutscene.counter
scoreboard players operation #curve_calc dynamic_cutscene.counter -= #t_scaled dynamic_cutscene.counter

scoreboard players operation #curve_calc dynamic_cutscene.counter *= #t_scaled dynamic_cutscene.counter
scoreboard players operation #curve_calc dynamic_cutscene.counter /= #1000 dynamic_cutscene.counter

scoreboard players set #curve_offset dynamic_cutscene.counter 32000
scoreboard players operation #curve_calc dynamic_cutscene.counter *= #curve_offset dynamic_cutscene.counter
scoreboard players operation #curve_calc dynamic_cutscene.counter /= #1000 dynamic_cutscene.counter

scoreboard players operation #final_x dynamic_cutscene.counter += #curve_calc dynamic_cutscene.counter

execute store result score #start_yaw dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data start_yaw 1000
execute store result score #start_pitch dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data start_pitch 1000

execute store result score #end_yaw dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data end_yaw 1000
execute store result score #end_pitch dynamic_cutscene.counter run data get storage dynamic_cutscene_interpolate_data end_pitch 1000

scoreboard players operation #diff_yaw dynamic_cutscene.counter = #end_yaw dynamic_cutscene.counter
scoreboard players operation #diff_yaw dynamic_cutscene.counter -= #start_yaw dynamic_cutscene.counter

scoreboard players operation #diff_pitch dynamic_cutscene.counter = #end_pitch dynamic_cutscene.counter
scoreboard players operation #diff_pitch dynamic_cutscene.counter -= #start_pitch dynamic_cutscene.counter

execute if score #diff_yaw dynamic_cutscene.counter matches 180001.. run scoreboard players remove #diff_yaw dynamic_cutscene.counter 360000
execute if score #diff_yaw dynamic_cutscene.counter matches ..-180001 run scoreboard players add #diff_yaw dynamic_cutscene.counter 360000

scoreboard players operation #diff_yaw dynamic_cutscene.counter *= #t_scaled dynamic_cutscene.counter
scoreboard players operation #diff_yaw dynamic_cutscene.counter /= #1000 dynamic_cutscene.counter

scoreboard players operation #diff_pitch dynamic_cutscene.counter *= #t_scaled dynamic_cutscene.counter
scoreboard players operation #diff_pitch dynamic_cutscene.counter /= #1000 dynamic_cutscene.counter

scoreboard players operation #final_yaw dynamic_cutscene.counter = #start_yaw dynamic_cutscene.counter
scoreboard players operation #final_yaw dynamic_cutscene.counter += #diff_yaw dynamic_cutscene.counter

scoreboard players operation #final_pitch dynamic_cutscene.counter = #start_pitch dynamic_cutscene.counter
scoreboard players operation #final_pitch dynamic_cutscene.counter += #diff_pitch dynamic_cutscene.counter

execute if score #final_yaw dynamic_cutscene.counter matches 360000.. run scoreboard players remove #final_yaw dynamic_cutscene.counter 360000
execute if score #final_yaw dynamic_cutscene.counter matches ..-1 run scoreboard players add #final_yaw dynamic_cutscene.counter 360000

execute store result storage dynamic_cutscene_interpolate_data final_x double 0.001 run scoreboard players get #final_x dynamic_cutscene.counter
execute store result storage dynamic_cutscene_interpolate_data final_y double 0.001 run scoreboard players get #final_y dynamic_cutscene.counter
execute store result storage dynamic_cutscene_interpolate_data final_z double 0.001 run scoreboard players get #final_z dynamic_cutscene.counter

execute store result storage dynamic_cutscene_interpolate_data final_yaw float 0.001 run scoreboard players get #final_yaw dynamic_cutscene.counter
execute store result storage dynamic_cutscene_interpolate_data final_pitch float 0.001 run scoreboard players get #final_pitch dynamic_cutscene.counter

function dynamic_cutscene:summon_interpolated_marker with storage dynamic_cutscene_interpolate_data

execute as @e[type=marker,tag=cutscene_point,tag=!positioned,limit=1,sort=nearest] run function dynamic_cutscene:positions/apply_position_tag with storage dynamic_cutscene:count

