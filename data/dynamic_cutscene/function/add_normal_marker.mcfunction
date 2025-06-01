tellraw @a [{"text":"DEBUG: add_normal_marker called","color":"red"}]
tellraw @a [{"text":"DEBUG: marker_count score: ","color":"red"},{"score":{"name":"#marker_count","objective":"dynamic_cutscene.counter"}}]
execute unless score #should_interpolate dynamic_cutscene.counter matches 1 run tellraw @a [{"text":"DEBUG: About to call add_normal_marker with count: ","color":"blue"},{"score":{"name":"#marker_count","objective":"dynamic_cutscene.counter"}}]
execute store result storage dynamic_cutscene:count count int 1 run scoreboard players get #marker_count dynamic_cutscene.counter

tellraw @a [{"text":"DEBUG: stored count: ","color":"red"},{"nbt":"count","storage":"dynamic_cutscene:count"}]

$execute at @s run summon marker ~ ~ ~ {Tags:["cutscene_point","$(cutscene_name)"]}
execute as @e[type=marker,tag=cutscene_point,tag=!positioned,limit=1,sort=nearest] run data modify entity @s Rotation set from entity @p Rotation

tellraw @a [{"text":"DEBUG: About to call apply_position_tag","color":"red"}]
function dynamic_cutscene:positions/apply_position_tag with storage dynamic_cutscene:count
tellraw @a [{"text":"DEBUG: apply_position_tag completed","color":"red"}]