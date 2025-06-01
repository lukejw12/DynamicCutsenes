# Clean up tags and finalize the interpolation
tag @e[type=marker,tag=interpolate_from] remove interpolate_from

# Give the final marker (interpolate_to) its proper position tag
scoreboard players add #marker_count dynamic_cutscene.counter 1
execute store result storage dynamic_cutscene:count count int 1 run scoreboard players get #marker_count dynamic_cutscene.counter
execute as @e[type=marker,tag=interpolate_to] run tag @s remove interpolate_to
execute as @e[type=marker,tag=cutscene_point,tag=!positioned,limit=1,sort=nearest] run function dynamic_cutscene:positions/apply_position_tag with storage dynamic_cutscene:count

tellraw @s [{"text":"Created interpolated path with ","color":"green"},{"nbt":"amount","storage":"dynamic_cutscene_interpolate","color":"yellow"},{"text":" intermediate points using ","color":"green"},{"nbt":"mode","storage":"dynamic_cutscene_interpolate","color":"yellow"},{"text":" interpolation","color":"green"}]