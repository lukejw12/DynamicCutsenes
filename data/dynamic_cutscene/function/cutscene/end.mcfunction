execute as @a[tag=spectating] run spectate
execute store result score #temp dynamic_cutscene.counter run data get storage dynamic_cutscene:player original_gamemode
execute if score #temp dynamic_cutscene.counter matches 0 run gamemode survival @s
execute if score #temp dynamic_cutscene.counter matches 1 run gamemode creative @s
execute if score #temp dynamic_cutscene.counter matches 2 run gamemode adventure @s
execute if score #temp dynamic_cutscene.counter matches 3 run gamemode spectator @s
function dynamic_cutscene:cutscene/restore_position with storage dynamic_cutscene:player
kill @e[type=item_display,tag=cutscene_camera]

$tag @a remove watching_$(cutscene_name)
scoreboard players reset * dynamic_cutscene.executed
scoreboard players reset #cutscene_step dynamic_cutscene.counter
scoreboard players set #cutscene_active dynamic_cutscene.counter 0
$tellraw @a {"text":"Cutscene $(cutscene_name) ended!","color":"green"}
