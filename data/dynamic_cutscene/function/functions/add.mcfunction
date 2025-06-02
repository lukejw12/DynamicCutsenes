$execute store result score #next_id dynamic_cutscene.counter run data get storage dynamic_cutscene:functions $(cutscene_name)
$data modify storage dynamic_cutscene:functions $(cutscene_name) append value {command:"$(command)",delay:$(delay),id:0}
$execute store result storage dynamic_cutscene:functions $(cutscene_name)[-1].id int 1 run scoreboard players get #next_id dynamic_cutscene.counter
$tellraw @s [{"text":"Added function: ","color":"green"},{"text":"$(command)","color":"aqua"},{"text":" with delay ","color":"green"},{"text":"$(delay)","color":"yellow"}]
$function dynamic_cutscene:menu/functions_menu {cutscene_name:"$(cutscene_name)"}