$tellraw @s [{"text":"Showing particles for cutscene: $(cutscene_name) for 15 seconds","color":"green"}]

$data modify storage dynamic_cutscene:particles cutscene_name set value "$(cutscene_name)"

scoreboard players set #particle_timer dynamic_cutscene.counter 15
function dynamic_cutscene:menu/particle_loop with storage dynamic_cutscene:particles