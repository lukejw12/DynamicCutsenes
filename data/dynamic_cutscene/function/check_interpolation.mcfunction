scoreboard players set #should_interpolate dynamic_cutscene.counter 0

$data modify storage dynamic_cutscene_interpolate test_mode set value "$(interpolate)"
execute store success score #mode_not_none dynamic_cutscene.counter run data modify storage dynamic_cutscene_interpolate test_mode set value "none"

$$execute if score #mode_not_none dynamic_cutscene.counter matches 1 unless score #$(amount) dynamic_cutscene.counter matches 0 run scoreboard players set #should_interpolate dynamic_cutscene.counter 1

execute if score #should_interpolate dynamic_cutscene.counter matches 1 run function dynamic_cutscene:start_interpolation with storage dynamic_cutscene:count