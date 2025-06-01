$data modify storage dynamic_cutscene:temp existing_item set from storage dynamic_cutscene:menu found_cutscenes[$(check_index)]
$execute store success score #different dynamic_cutscene.counter run data modify storage dynamic_cutscene:temp existing_item set value "$(current_tag)"

execute if score #different dynamic_cutscene.counter matches 0 run scoreboard players set #found_duplicate dynamic_cutscene.counter 1