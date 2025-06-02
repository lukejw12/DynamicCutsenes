
$scoreboard players set #interpolate_amount dynamic_cutscene.counter $(amount)
$data modify storage dynamic_cutscene_interpolate_data mode set value "$(mode)"
scoreboard players set #interpolate_step dynamic_cutscene.counter 0
$data modify storage dynamic_cutscene_interpolate_data cutscene_name set value "$(cutscene_name)"
scoreboard players set #1000 dynamic_cutscene.counter 1000

execute as @e[type=marker,tag=interpolate_from] run function dynamic_cutscene:store_start_data
execute as @e[type=marker,tag=interpolate_to] run function dynamic_cutscene:store_end_data
function dynamic_cutscene:interpolate_loop with storage dynamic_cutscene_interpolate_data