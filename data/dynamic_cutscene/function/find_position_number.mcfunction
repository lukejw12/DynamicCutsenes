scoreboard players set @s dynamic_cutscene.temp_pos 0
data modify storage dynamic_cutscene:temp entity_tags set from entity @s Tags
scoreboard players set #tag_index dynamic_cutscene.counter 0
function dynamic_cutscene:extract_position_from_tags
execute if score @s dynamic_cutscene.temp_pos > #highest_pos dynamic_cutscene.counter run scoreboard players operation #highest_pos dynamic_cutscene.counter = @s dynamic_cutscene.temp_pos