execute unless score #marker_count dynamic_cutscene.counter = #marker_count dynamic_cutscene.counter run scoreboard players set #marker_count dynamic_cutscene.counter 0

$data modify storage dynamic_cutscene:count cutscene_name set value "$(cutscene_name)"
$data modify storage dynamic_cutscene_interpolate amount set value $(amount)
$data modify storage dynamic_cutscene_interpolate mode set value "$(interpolate)"

scoreboard players set #should_interpolate dynamic_cutscene.counter 0

$data modify storage dynamic_cutscene_temp test_mode set value "$(interpolate)"
execute store success score #mode_not_none dynamic_cutscene.counter run data modify storage dynamic_cutscene_temp test_mode set value "none"

$scoreboard players set #amount_check dynamic_cutscene.counter $(amount)
execute if score #marker_count dynamic_cutscene.counter matches 1.. if score #mode_not_none dynamic_cutscene.counter matches 1 unless score #amount_check dynamic_cutscene.counter matches 0 run scoreboard players set #should_interpolate dynamic_cutscene.counter 1

execute if score #should_interpolate dynamic_cutscene.counter matches 1 run function dynamic_cutscene:start_interpolation with storage dynamic_cutscene:count

execute unless score #should_interpolate dynamic_cutscene.counter matches 1 run function dynamic_cutscene:add_normal_marker with storage dynamic_cutscene:count