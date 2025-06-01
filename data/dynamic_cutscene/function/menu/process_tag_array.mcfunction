execute store result score #tag_index dynamic_cutscene.counter run data get storage dynamic_cutscene:temp tag_index
execute store result score #array_size dynamic_cutscene.counter run data get storage dynamic_cutscene:temp marker_tags

execute if score #tag_index dynamic_cutscene.counter >= #array_size dynamic_cutscene.counter run return 0

function dynamic_cutscene:menu/get_current_tag with storage dynamic_cutscene:temp

execute store result storage dynamic_cutscene:temp tag_index int 1 run scoreboard players add #tag_index dynamic_cutscene.counter 1
function dynamic_cutscene:menu/process_tag_array