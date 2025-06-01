data modify storage dynamic_cutscene:temp tag_check set string storage dynamic_cutscene:temp current_tag 0 9
execute store success score #not_position dynamic_cutscene.counter run data modify storage dynamic_cutscene:temp tag_check set value "position_"
execute if score #not_position dynamic_cutscene.counter matches 0 run scoreboard players set #is_position_tag dynamic_cutscene.counter 1
