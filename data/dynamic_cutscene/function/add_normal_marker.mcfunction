scoreboard players add #marker_count dynamic_cutscene.counter 1
execute store result storage dynamic_cutscene:count count int 1 run scoreboard players get #marker_count dynamic_cutscene.counter

$execute at @s run summon marker ~ ~ ~ {Tags:["cutscene_point","$(cutscene_name)"]}
execute as @e[type=marker,tag=cutscene_point,tag=!positioned,limit=1,sort=nearest] run data modify entity @s Rotation set from entity @p Rotation
function dynamic_cutscene:positions/apply_position_tag with storage dynamic_cutscene:count