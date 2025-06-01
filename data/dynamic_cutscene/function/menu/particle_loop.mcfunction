# Show particles at all markers
$execute as @e[type=marker,tag=cutscene_point,tag=$(cutscene_name)] at @s run particle minecraft:end_rod ~ ~1 ~ 0 0 0 0 20 force

# Decrease timer
scoreboard players remove #particle_timer dynamic_cutscene.counter 1

# Continue if timer hasn't reached 0
execute if score #particle_timer dynamic_cutscene.counter matches 1.. run schedule function dynamic_cutscene:menu/particle_loop_continue 20t

# Show completion message when done
execute if score #particle_timer dynamic_cutscene.counter matches 0 run tellraw @a [{"text":"Particle display ended","color":"yellow"}]