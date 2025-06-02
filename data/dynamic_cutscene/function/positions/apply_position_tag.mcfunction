
$execute if entity @e[type=marker,tag=cutscene_point,tag=$(cutscene_name),tag=!positioned,tag=!no_auto_position,limit=1,sort=nearest] run tag @e[type=marker,tag=cutscene_point,tag=$(cutscene_name),tag=!positioned,tag=!no_auto_position,limit=1,sort=nearest] add position_$(count)
$execute if entity @e[type=marker,tag=cutscene_point,tag=$(cutscene_name),tag=!positioned,tag=!no_auto_position,limit=1,sort=nearest] run tag @e[type=marker,tag=cutscene_point,tag=$(cutscene_name),tag=!positioned,tag=!no_auto_position,limit=1,sort=nearest] add positioned
