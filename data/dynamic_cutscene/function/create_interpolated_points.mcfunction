$tellraw @a [{"text":"DEBUG: Creating interpolated points, amount: $(amount), mode: $(mode)","color":"aqua"}]

# Set up interpolation variables
$scoreboard players set #interpolate_amount dynamic_cutscene.counter $(amount)
$data modify storage dynamic_cutscene_interpolate_data mode set value "$(mode)"
scoreboard players set #interpolate_step dynamic_cutscene.counter 0
$data modify storage dynamic_cutscene_interpolate_data cutscene_name set value "$(cutscene_name)"

# Initialize math constants
scoreboard players set #1000 dynamic_cutscene.counter 1000

# Get positions and rotations of start and end points
execute as @e[type=marker,tag=interpolate_from] run function dynamic_cutscene:store_start_data
execute as @e[type=marker,tag=interpolate_to] run function dynamic_cutscene:store_end_data

tellraw @a [{"text":"DEBUG: Starting interpolate loop","color":"blue"}]
# Start creating interpolated markers
function dynamic_cutscene:interpolate_loop with storage dynamic_cutscene_interpolate_data