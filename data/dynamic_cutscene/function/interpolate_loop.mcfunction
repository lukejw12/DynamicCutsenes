
execute if score #interpolate_step dynamic_cutscene.counter >= #interpolate_amount dynamic_cutscene.counter run function dynamic_cutscene:finish_interpolation with storage dynamic_cutscene:count
execute if score #interpolate_step dynamic_cutscene.counter >= #interpolate_amount dynamic_cutscene.counter run return 0

scoreboard players operation #current_step dynamic_cutscene.counter = #interpolate_step dynamic_cutscene.counter
scoreboard players add #current_step dynamic_cutscene.counter 1

scoreboard players operation #total_segments dynamic_cutscene.counter = #interpolate_amount dynamic_cutscene.counter
scoreboard players add #total_segments dynamic_cutscene.counter 1

scoreboard players operation #t_calc dynamic_cutscene.counter = #current_step dynamic_cutscene.counter
scoreboard players operation #t_calc dynamic_cutscene.counter *= #1000 dynamic_cutscene.counter
scoreboard players operation #t_calc dynamic_cutscene.counter /= #total_segments dynamic_cutscene.counter
execute store result storage dynamic_cutscene_interpolate_data t float 0.001 run scoreboard players get #t_calc dynamic_cutscene.counter


data modify storage dynamic_cutscene_interpolate_data test_mode set from storage dynamic_cutscene_interpolate_data mode
execute store success score #is_line dynamic_cutscene.counter run data modify storage dynamic_cutscene_interpolate_data test_mode set value "line"

data modify storage dynamic_cutscene_interpolate_data test_mode set from storage dynamic_cutscene_interpolate_data mode
execute store success score #is_curve_y dynamic_cutscene.counter run data modify storage dynamic_cutscene_interpolate_data test_mode set value "curve_y"

data modify storage dynamic_cutscene_interpolate_data test_mode set from storage dynamic_cutscene_interpolate_data mode
execute store success score #is_curve_x dynamic_cutscene.counter run data modify storage dynamic_cutscene_interpolate_data test_mode set value "curve_x"

data modify storage dynamic_cutscene_interpolate_data test_mode set from storage dynamic_cutscene_interpolate_data mode
execute store success score #is_curve_z dynamic_cutscene.counter run data modify storage dynamic_cutscene_interpolate_data test_mode set value "curve_z"

data modify storage dynamic_cutscene_interpolate_data test_mode set from storage dynamic_cutscene_interpolate_data mode
execute store success score #is_curve_legacy dynamic_cutscene.counter run data modify storage dynamic_cutscene_interpolate_data test_mode set value "curve"


execute if score #is_line dynamic_cutscene.counter matches 0 run function dynamic_cutscene:interpolate_linear with storage dynamic_cutscene_interpolate_data

execute if score #is_curve_y dynamic_cutscene.counter matches 0 run function dynamic_cutscene:interpolate_curve_y with storage dynamic_cutscene_interpolate_data

execute if score #is_curve_x dynamic_cutscene.counter matches 0 run function dynamic_cutscene:interpolate_curve_x with storage dynamic_cutscene_interpolate_data

execute if score #is_curve_z dynamic_cutscene.counter matches 0 run function dynamic_cutscene:interpolate_curve_z with storage dynamic_cutscene_interpolate_data

execute if score #is_curve_legacy dynamic_cutscene.counter matches 0 run function dynamic_cutscene:interpolate_curve_y with storage dynamic_cutscene_interpolate_data

scoreboard players add #interpolate_step dynamic_cutscene.counter 1
function dynamic_cutscene:interpolate_loop with storage dynamic_cutscene_interpolate_data