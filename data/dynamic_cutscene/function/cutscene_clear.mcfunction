$execute store result score #cleared dynamic_cutscene.counter if entity @e[type=marker,tag=cutscene_point,tag=$(cutscene_name)]
$kill @e[type=marker,tag=cutscene_point,tag=$(cutscene_name)]

execute store result score #remaining_markers dynamic_cutscene.counter if entity @e[type=marker,tag=cutscene_point]
execute if score #remaining_markers dynamic_cutscene.counter matches 0 run scoreboard players reset #marker_count dynamic_cutscene.counter

$tellraw @s [{"text":"Cleared all markers for cutscene: ","color":"yellow"},{"text":"$(cutscene_name)","color":"green"}]