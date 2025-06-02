$data modify storage dynamic_cutscene:temp current_tag set from storage dynamic_cutscene:temp entity_tags[$(current_tag_index)]
data modify storage dynamic_cutscene:temp tag_test set string storage dynamic_cutscene:temp current_tag 0 9
execute store success score #is_position_tag dynamic_cutscene.counter run data modify storage dynamic_cutscene:temp tag_test set value "position_"
execute if score #is_position_tag dynamic_cutscene.counter matches 0 run function dynamic_cutscene:extract_position_number