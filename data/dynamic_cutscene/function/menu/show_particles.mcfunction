$tellraw @s [{"text":"Showing $(particle) particles for cutscene: $(cutscene_name) for $(duration) seconds","color":"green"}]

$data modify storage dynamic_cutscene:particles cutscene_name set value "$(cutscene_name)"
$data modify storage dynamic_cutscene:particles particle_type set value "$(particle)"

$scoreboard players set #particle_timer dynamic_cutscene.counter $(duration)
function dynamic_cutscene:menu/particle_loop with storage dynamic_cutscene:particles