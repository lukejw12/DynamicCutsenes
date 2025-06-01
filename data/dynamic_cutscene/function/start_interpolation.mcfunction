$tellraw @a [{"text":"DEBUG: Starting interpolation for $(cutscene_name)","color":"aqua"}]
tellraw @a [{"text":"DEBUG: Marker count: ","color":"aqua"},{"score":{"name":"#marker_count","objective":"dynamic_cutscene.counter"}}]

scoreboard players operation #previous_pos dynamic_cutscene.counter = #marker_count dynamic_cutscene.counter
scoreboard players remove #previous_pos dynamic_cutscene.counter 1

tellraw @a [{"text":"DEBUG: Looking for previous position: ","color":"yellow"},{"score":{"name":"#previous_pos","objective":"dynamic_cutscene.counter"}}]

$execute if score #previous_pos dynamic_cutscene.counter matches 1 run tag @e[type=marker,tag=position_1,tag=$(cutscene_name)] add interpolate_from
$execute if score #previous_pos dynamic_cutscene.counter matches 2 run tag @e[type=marker,tag=position_2,tag=$(cutscene_name)] add interpolate_from
$execute if score #previous_pos dynamic_cutscene.counter matches 3 run tag @e[type=marker,tag=position_3,tag=$(cutscene_name)] add interpolate_from
$execute if score #previous_pos dynamic_cutscene.counter matches 4 run tag @e[type=marker,tag=position_4,tag=$(cutscene_name)] add interpolate_from
$execute if score #previous_pos dynamic_cutscene.counter matches 5 run tag @e[type=marker,tag=position_5,tag=$(cutscene_name)] add interpolate_from
$execute if score #previous_pos dynamic_cutscene.counter matches 6 run tag @e[type=marker,tag=position_6,tag=$(cutscene_name)] add interpolate_from
$execute if score #previous_pos dynamic_cutscene.counter matches 7 run tag @e[type=marker,tag=position_7,tag=$(cutscene_name)] add interpolate_from
$execute if score #previous_pos dynamic_cutscene.counter matches 8 run tag @e[type=marker,tag=position_8,tag=$(cutscene_name)] add interpolate_from
$execute if score #previous_pos dynamic_cutscene.counter matches 9 run tag @e[type=marker,tag=position_9,tag=$(cutscene_name)] add interpolate_from
$execute if score #previous_pos dynamic_cutscene.counter matches 10 run tag @e[type=marker,tag=position_10,tag=$(cutscene_name)] add interpolate_from

execute if entity @e[type=marker,tag=interpolate_from] run tellraw @a [{"text":"DEBUG: Successfully tagged interpolate_from marker","color":"green"}]
execute unless entity @e[type=marker,tag=interpolate_from] run tellraw @a [{"text":"DEBUG: FAILED to tag interpolate_from marker","color":"red"}]
$tellraw @a [{"text":"DEBUG: All markers for $(cutscene_name):","color":"blue"}]
$execute as @e[type=marker,tag=cutscene_point,tag=$(cutscene_name)] run tellraw @a [{"text":"  - Marker tags: ","color":"gray"},{"nbt":"Tags","entity":"@s","color":"white"}]

tellraw @a [{"text":"DEBUG: Looking for position_1 markers:","color":"blue"}]
$execute store result score #pos1_count dynamic_cutscene.counter if entity @e[type=marker,tag=position_1,tag=$(cutscene_name)]
tellraw @a [{"text":"  - Found position_1 markers: ","color":"gray"},{"score":{"name":"#pos1_count","objective":"dynamic_cutscene.counter"}}]

tellraw @a [{"text":"DEBUG: Looking for position_2 markers:","color":"blue"}]
$execute store result score #pos2_count dynamic_cutscene.counter if entity @e[type=marker,tag=position_2,tag=$(cutscene_name)]
tellraw @a [{"text":"  - Found position_2 markers: ","color":"gray"},{"score":{"name":"#pos2_count","objective":"dynamic_cutscene.counter"}}]
$execute at @s run summon marker ~ ~ ~ {Tags:["cutscene_point","$(cutscene_name)","interpolate_to"]}
execute as @e[type=marker,tag=interpolate_to,limit=1,sort=nearest] run data modify entity @s Rotation set from entity @p Rotation
execute as @e[type=marker,tag=interpolate_to] run tellraw @a [{"text":"DEBUG: Created interpolate_to marker","color":"green"}]

data modify storage dynamic_cutscene_temp amount set from storage dynamic_cutscene_interpolate amount
data modify storage dynamic_cutscene_temp mode set from storage dynamic_cutscene_interpolate mode
$data modify storage dynamic_cutscene_temp cutscene_name set value "$(cutscene_name)"

tellraw @a [{"text":"DEBUG: Starting interpolation process","color":"aqua"}]
function dynamic_cutscene:create_interpolated_points with storage dynamic_cutscene_temp