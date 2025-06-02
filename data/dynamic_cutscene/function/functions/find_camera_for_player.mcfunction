execute store result score #tag_count dynamic_cutscene.counter run data get storage dynamic_cutscene:temp player_tags
execute if score #tag_index dynamic_cutscene.counter >= #tag_count dynamic_cutscene.counter run return 0

execute store result storage dynamic_cutscene:temp current_tag_index int 1 run scoreboard players get #tag_index dynamic_cutscene.counter
function dynamic_cutscene:functions/check_watching_tag_for_camera with storage dynamic_cutscene:temp

scoreboard players add #tag_index dynamic_cutscene.counter 1
function dynamic_cutscene:functions/find_camera_for_player