$tellraw @a [{"text":"DEBUG: Linear interpolation with t=$(t) for $(cutscene_name)","color":"blue"}]

# Increment marker count first
scoreboard players add #marker_count dynamic_cutscene.counter 1
execute store result storage dynamic_cutscene:count count int 1 run scoreboard players get #marker_count dynamic_cutscene.counter

# Copy cutscene name to the count storage for apply_position_tag
$data modify storage dynamic_cutscene:count cutscene_name set value "$(cutscene_name)"

# Debug: Check if we have interpolate_from marker
execute if entity @e[type=marker,tag=interpolate_from] run tellraw @a [{"text":"DEBUG: Found interpolate_from marker","color":"green"}]
execute unless entity @e[type=marker,tag=interpolate_from] run tellraw @a [{"text":"DEBUG: NO interpolate_from marker found!","color":"red"}]

# Debug: Check if we have interpolate_to marker
execute if entity @e[type=marker,tag=interpolate_to] run tellraw @a [{"text":"DEBUG: Found interpolate_to marker","color":"green"}]
execute unless entity @e[type=marker,tag=interpolate_to] run tellraw @a [{"text":"DEBUG: NO interpolate_to marker found!","color":"red"}]

# Simple marker spawn test
execute as @e[type=marker,tag=interpolate_from] at @s run tellraw @a [{"text":"DEBUG: At interpolate_from position","color":"yellow"}]
$execute as @e[type=marker,tag=interpolate_from] at @s run summon marker ~ ~5 ~ {Tags:["cutscene_point","$(cutscene_name)","interpolated","debug_marker"]}

# Count how many markers we created
execute store result score #debug_markers dynamic_cutscene.counter if entity @e[type=marker,tag=debug_marker]
tellraw @a [{"text":"DEBUG: Created markers: ","color":"aqua"},{"score":{"name":"#debug_markers","objective":"dynamic_cutscene.counter"}}]
# Apply position tag to the new marker
execute as @e[type=marker,tag=cutscene_point,tag=!positioned,limit=1,sort=nearest] run function dynamic_cutscene:positions/apply_position_tag with storage dynamic_cutscene:count

tellraw @a [{"text":"DEBUG: Finished interpolation step","color":"green"}]