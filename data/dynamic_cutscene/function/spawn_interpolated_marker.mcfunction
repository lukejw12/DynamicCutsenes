# Increment marker count and place interpolated marker
scoreboard players add #marker_count dynamic_cutscene.counter 1
execute store result storage dynamic_cutscene:count count int 1 run scoreboard players get #marker_count dynamic_cutscene.counter

# Spawn the interpolated marker
$execute at @s run summon marker ~ ~ ~ {Tags:["cutscene_point","$(cutscene_name)","interpolated"]}

# Apply position tag
function dynamic_cutscene:positions/apply_position_tag with storage dynamic_cutscene:count

# Set rotation (interpolated between start and end) - simplified for now
execute as @e[type=marker,tag=cutscene_point,tag=!positioned,limit=1,sort=nearest] run data modify entity @s Rotation[0] set value 0.0f
execute as @e[type=marker,tag=cutscene_point,tag=!positioned,limit=1,sort=nearest] run data modify entity @s Rotation[1] set value 0.0f