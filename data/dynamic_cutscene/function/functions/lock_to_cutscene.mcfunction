data modify storage dynamic_cutscene:temp player_tags set from entity @s Tags
scoreboard players set #tag_index dynamic_cutscene.counter 0
function dynamic_cutscene:functions/find_camera_for_player