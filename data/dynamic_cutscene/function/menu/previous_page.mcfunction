scoreboard players remove @s dynamic_cutscene.menu_page 1
execute if score @s dynamic_cutscene.menu_page matches ..0 run scoreboard players set @s dynamic_cutscene.menu_page 1

function dynamic_cutscene:admin/admin_menu