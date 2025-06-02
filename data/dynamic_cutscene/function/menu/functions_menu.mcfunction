$tellraw @s [{"text":"\n===== $(cutscene_name) FUNCTIONS =====","color":"gold","bold":true}]
$execute unless data storage dynamic_cutscene:functions $(cutscene_name) run data modify storage dynamic_cutscene:functions $(cutscene_name) set value []
$tellraw @s [{"text":"➕ Add Function","color":"green","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:functions/add {cutscene_name:\"$(cutscene_name)\",command:\"say hello\",delay:0}"},"hover_event":{"action":"show_text","value":"Click to add a new function. Edit the command and delay as needed."}}]
$execute store result score #function_count dynamic_cutscene.counter run data get storage dynamic_cutscene:functions $(cutscene_name)
$data modify storage dynamic_cutscene:temp current_cutscene set value "$(cutscene_name)"
execute if score #function_count dynamic_cutscene.counter matches 1.. run tellraw @s [{"text":"Current Functions:","color":"yellow"}]
execute if score #function_count dynamic_cutscene.counter matches 1.. run scoreboard players set #display_index dynamic_cutscene.counter 0
execute if score #function_count dynamic_cutscene.counter matches 1.. run function dynamic_cutscene:menu/display_functions_loop
$tellraw @s [{"text":"⬅️ Back to $(cutscene_name) Options","color":"gray","click_event":{"action":"run_command","command":"/function dynamic_cutscene:menu/cutscene_options {cutscene_name:\"$(cutscene_name)\"}"},"hover_event":{"action":"show_text","value":"Return to cutscene options"}}]