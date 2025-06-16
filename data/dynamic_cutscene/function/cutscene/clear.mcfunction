$kill @e[type=marker,tag=cutscene_point,tag=$(cutscene_name)]
$execute store result score #cleared dynamic_cutscene.counter if entity @e[type=marker,tag=cutscene_point,tag=$(cutscene_name)]
$data remove storage dynamic_cutscene:functions $(cutscene_name)
$data remove storage dynamic_cutscene:display_names $(cutscene_name)

$tellraw @s [{"text":"Cleared all markers and functions for cutscene: ","color":"yellow"},{"text":"$(cutscene_name)","color":"green"}]
function dynamic_cutscene:menu/check_page_after_clear
function dynamic_cutscene:admin/admin_menu