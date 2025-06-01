scoreboard players set #is_position_tag dynamic_cutscene.counter 0
$data modify storage dynamic_cutscene:temp tag_test set value "$(current_tag)"
execute store success score #not_cutscene_point dynamic_cutscene.counter run data modify storage dynamic_cutscene:temp tag_test set value "cutscene_point"
execute if score #not_cutscene_point dynamic_cutscene.counter matches 0 run return 0
$data modify storage dynamic_cutscene:temp tag_test set value "$(current_tag)"
execute store success score #not_positioned dynamic_cutscene.counter run data modify storage dynamic_cutscene:temp tag_test set value "positioned"
execute if score #not_positioned dynamic_cutscene.counter matches 0 run return 0
execute store result score #tag_length dynamic_cutscene.counter run data get storage dynamic_cutscene:temp current_tag
execute if score #tag_length dynamic_cutscene.counter matches 9.. run function dynamic_cutscene:menu/check_position_tag with storage dynamic_cutscene:temp
execute if score #is_position_tag dynamic_cutscene.counter matches 0 run function dynamic_cutscene:menu/process_cutscene_tag with storage dynamic_cutscene:temp