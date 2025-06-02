$scoreboard players set cutscene_$(current_cutscene)_func_$(check_index) dynamic_cutscene.executed 1
$execute as @a[tag=watching_$(current_cutscene)] run $(command)