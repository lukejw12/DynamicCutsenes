$data remove storage dynamic_cutscene:functions $(cutscene_name)[$(index)]
tellraw @s [{"text":"Function removed!","color":"yellow"}]
$function dynamic_cutscene:menu/functions_menu {cutscene_name:"$(cutscene_name)"}