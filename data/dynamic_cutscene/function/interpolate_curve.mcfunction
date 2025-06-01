$tellraw @a [{"text":"DEBUG: Curve interpolation with t=$(t)","color":"blue"}]

# Increment marker count first
scoreboard players add #marker_count dynamic_cutscene.counter 1
execute store result storage dynamic_cutscene:count count int 1 run scoreboard players get #marker_count dynamic_cutscene.counter

# Simple curve: move forward and add some height variation
$execute as @e[type=marker,tag=interpolate_from] at @s facing entity @e[type=marker,tag=interpolate_to] eyes positioned ^ ^ ^$(t)0 positioned ~ ~2 ~ run summon marker ~ ~ ~ {Tags:["cutscene_point","$(cutscene_name)","interpolated"]}

# Apply position tag to the new marker
execute as @e[type=marker,tag=cutscene_point,tag=!positioned,limit=1,sort=nearest] run function dynamic_cutscene:positions/apply_position_tag with storage dynamic_cutscene:count

tellraw @a [{"text":"DEBUG: Created curved interpolated marker","color":"green"}]