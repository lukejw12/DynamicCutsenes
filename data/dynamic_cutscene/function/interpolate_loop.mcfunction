tellraw @a [{"text":"DEBUG: Interpolate step: ","color":"gray"},{"score":{"name":"#interpolate_step","objective":"dynamic_cutscene.counter"}},{"text":" / ","color":"gray"},{"score":{"name":"#interpolate_amount","objective":"dynamic_cutscene.counter"}}]

# Check if we're done interpolating
execute if score #interpolate_step dynamic_cutscene.counter >= #interpolate_amount dynamic_cutscene.counter run tellraw @a [{"text":"DEBUG: Interpolation complete!","color":"green"}]
execute if score #interpolate_step dynamic_cutscene.counter >= #interpolate_amount dynamic_cutscene.counter run function dynamic_cutscene:finish_interpolation with storage dynamic_cutscene:count
execute if score #interpolate_step dynamic_cutscene.counter >= #interpolate_amount dynamic_cutscene.counter run return 0

# Calculate interpolation factor (0.0 to 1.0)
scoreboard players operation #current_step dynamic_cutscene.counter = #interpolate_step dynamic_cutscene.counter
scoreboard players add #current_step dynamic_cutscene.counter 1

# Calculate t value (progress from 0 to 1)
scoreboard players operation #t_calc dynamic_cutscene.counter = #current_step dynamic_cutscene.counter
scoreboard players operation #t_calc dynamic_cutscene.counter *= #1000 dynamic_cutscene.counter
scoreboard players operation #t_calc dynamic_cutscene.counter /= #interpolate_amount dynamic_cutscene.counter
execute store result storage dynamic_cutscene_interpolate_data t float 0.001 run scoreboard players get #t_calc dynamic_cutscene.counter

tellraw @a [{"text":"DEBUG: t value: ","color":"gray"},{"nbt":"t","storage":"dynamic_cutscene_interpolate_data"}]

# Create interpolated marker based on mode using proper data comparison
data modify storage dynamic_cutscene_interpolate_data test_mode set from storage dynamic_cutscene_interpolate_data mode
execute store success score #is_line dynamic_cutscene.counter run data modify storage dynamic_cutscene_interpolate_data test_mode set value "line"

tellraw @a [{"text":"DEBUG: is_line score after test: ","color":"gray"},{"score":{"name":"#is_line","objective":"dynamic_cutscene.counter"}}]
tellraw @a [{"text":"DEBUG: stored mode: ","color":"gray"},{"nbt":"mode","storage":"dynamic_cutscene_interpolate_data"}]

execute if score #is_line dynamic_cutscene.counter matches 0 run tellraw @a [{"text":"DEBUG: About to call interpolate_linear","color":"yellow"}]
execute if score #is_line dynamic_cutscene.counter matches 0 run function dynamic_cutscene:interpolate_linear with storage dynamic_cutscene_interpolate_data

execute unless score #is_line dynamic_cutscene.counter matches 0 run tellraw @a [{"text":"DEBUG: Mode is not line, trying curve","color":"yellow"}]
execute unless score #is_line dynamic_cutscene.counter matches 0 run data modify storage dynamic_cutscene_interpolate_data test_mode set from storage dynamic_cutscene_interpolate_data mode
execute unless score #is_line dynamic_cutscene.counter matches 0 run execute store success score #is_curve dynamic_cutscene.counter run data modify storage dynamic_cutscene_interpolate_data test_mode set value "curve"
execute unless score #is_line dynamic_cutscene.counter matches 0 run execute if score #is_curve dynamic_cutscene.counter matches 0 run function dynamic_cutscene:interpolate_curve with storage dynamic_cutscene_interpolate_data

# Continue loop
scoreboard players add #interpolate_step dynamic_cutscene.counter 1
function dynamic_cutscene:interpolate_loop with storage dynamic_cutscene_interpolate_data
