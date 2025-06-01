$execute as @e[type=item_display,tag=cutscene_camera] run tp @s @e[type=marker,tag=position_$(step),tag=$(cutscene_name),limit=1]

scoreboard players add #cutscene_step dynamic_cutscene.counter 1
execute store result storage dynamic_cutscene:cutscene step int 1 run scoreboard players get #cutscene_step dynamic_cutscene.counter

$execute if entity @e[type=marker,tag=position_$(step)] run schedule function dynamic_cutscene:cutscene/next_step 20t
$execute unless entity @e[type=marker,tag=position_$(step),tag=$(cutscene_name)] run schedule function dynamic_cutscene:cutscene/delay_end $(speed)t