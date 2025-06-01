tellraw @a [{"text":"DEBUG: INITIAL marker_count score: ","color":"red"},{"score":{"name":"#marker_count","objective":"dynamic_cutscene.counter"}}]
scoreboard players set #should_interpolate dynamic_cutscene.counter 0

$data modify storage dynamic_cutscene_temp test_mode set value "$(interpolate)"
execute store success score #mode_not_none dynamic_cutscene.counter run data modify storage dynamic_cutscene_temp test_mode set value "none"

tellraw @a [{"text":"DEBUG: mode_not_none score: ","color":"gold"},{"score":{"name":"#mode_not_none","objective":"dynamic_cutscene.counter"}}]
$tellraw @a [{"text":"DEBUG: interpolate parameter: $(interpolate)","color":"gold"}]

$execute if score #marker_count dynamic_cutscene.counter matches 2.. if score #mode_not_none dynamic_cutscene.counter matches 1 unless score #$(amount) dynamic_cutscene.counter matches 0 run scoreboard players set #should_interpolate dynamic_cutscene.counter 1

tellraw @a [{"text":"DEBUG: should_interpolate: ","color":"gold"},{"score":{"name":"#should_interpolate","objective":"dynamic_cutscene.counter"}}]

execute if score #should_interpolate dynamic_cutscene.counter matches 1 run tellraw @a [{"text":"DEBUG: Taking interpolation path","color":"green"}]
execute if score #should_interpolate dynamic_cutscene.counter matches 1 run function dynamic_cutscene:start_interpolation with storage dynamic_cutscene:count

execute unless score #should_interpolate dynamic_cutscene.counter matches 1 run tellraw @a [{"text":"DEBUG: Taking normal marker path","color":"blue"}]
execute unless score #should_interpolate dynamic_cutscene.counter matches 1 run function dynamic_cutscene:add_normal_marker with storage dynamic_cutscene:count