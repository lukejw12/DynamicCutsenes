$tellraw @a [{"text":"DEBUG: apply_position_tag called with count: $(count) and cutscene: $(cutscene_name)","color":"blue"}]

$tag @e[type=marker,tag=cutscene_point,tag=$(cutscene_name),tag=!positioned,limit=1,sort=nearest] add position_$(count)

$tellraw @a [{"text":"DEBUG: Applied position_$(count) tag","color":"blue"}]

$tag @e[type=marker,tag=cutscene_point,tag=$(cutscene_name),tag=!positioned,limit=1,sort=nearest] add positioned

tellraw @a [{"text":"DEBUG: Applied positioned tag","color":"blue"}]