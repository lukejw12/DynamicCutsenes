$execute store result score #cleared dynamic_cutscene.counter if entity @e[type=marker,tag=cutscene_point,tag=$(cutscene_name)]
$kill @e[type=marker,tag=cutscene_point,tag=$(cutscene_name)]
$tellraw @s [{"text":"Cleared all markers for cutscene: ","color":"yellow"},{"text":"$(cutscene_name)","color":"green"}]