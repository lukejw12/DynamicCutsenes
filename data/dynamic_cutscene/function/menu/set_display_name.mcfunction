$data modify storage dynamic_cutscene:display_names $(cutscene_name) set value "$(display_name)"
$tellraw @s [{"text":"Set display name for ","color":"green"},{"text":"$(cutscene_name)","color":"yellow"},{"text":" to: ","color":"green"},{"text":"$(display_name)","color":"aqua"}]
$function dynamic_cutscene:menu/cutscene_options {cutscene_name:"$(cutscene_name)"}