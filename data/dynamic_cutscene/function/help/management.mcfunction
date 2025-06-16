tellraw @s [{"text":"\n======= CUTSCENE MANAGEMENT =======","color":"blue","bold":true}]
tellraw @s [{"text":"Click any command to auto-fill it in chat!","color":"yellow","italic":true}]
tellraw @s [{"text":"","color":"gray"}]

tellraw @s [{"text":"🔍 VIEWING & ORGANIZING","color":"gold","bold":true}]
tellraw @s [{"text":"• Open Admin Menu","color":"white","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:admin/admin_menu"},"hover_event":{"action":"show_text","value":"Opens the main cutscene management interface. View all cutscenes, access options, and manage your projects."}}]
tellraw @s [{"text":"• Show Particles (15 sec)","color":"green","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:menu/show_particles {cutscene_name:\"my_cutscene\",duration:15,particle:\"end_rod\"}"},"hover_event":{"action":"show_text","value":"Shows end_rod particles at all cutscene points for 15 seconds. Perfect for visualizing your camera path."}}]
tellraw @s [{"text":"• Show Particles (Custom)","color":"green","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:menu/show_particles {cutscene_name:\"my_cutscene\",duration:30,particle:\"flame\"}"},"hover_event":{"action":"show_text","value":"Customize the particle type and duration. Try: flame, soul, enchant, heart, note, portal, etc."}}]

tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"✎ EDITING & FUNCTIONS","color":"gold","bold":true}]
tellraw @s [{"text":"• Set Display Name","color":"white","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:menu/set_display_name {cutscene_name:\"my_cutscene\",display_name:\"Epic Intro\"}"},"hover_event":{"action":"show_text","value":"Give your cutscene a custom display name that appears in the admin menu. Makes organization much easier!"}}]
tellraw @s [{"text":"• Add Function","color":"aqua","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:functions/add {cutscene_name:\"my_cutscene\",command:\"say Hello!\",delay:0}"},"hover_event":{"action":"show_text","value":"Add a command that executes during the cutscene. Delay=0 runs at start, delay=30 runs after 30 ticks, etc."}}]

tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"🗑 CLEANUP COMMANDS","color":"gold","bold":true}]
tellraw @s [{"text":"• Clear Single Cutscene","color":"red","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:cutscene_clear {cutscene_name:\"my_cutscene\"}"},"hover_event":{"action":"show_text","value":"⚠️ DANGER: Permanently deletes ALL markers and data for the specified cutscene. Cannot be undone!"}}]
tellraw @s [{"text":"• Clear All Cutscenes","color":"dark_red","click_event":{"action":"run_command","command":"/function dynamic_cutscene:menu/confirm_clear_all"},"hover_event":{"action":"show_text","value":"⚠️ EXTREME DANGER: Opens confirmation to delete ALL cutscenes in your world. Use with extreme caution!"}}]

tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"📋 ORGANIZATION TIPS","color":"gold","bold":true}]
tellraw @s [{"text":"• Use descriptive names","color":"gray","hover_event":{"action":"show_text","value":"Name cutscenes like 'castle_intro', 'battle_finale', 'peaceful_tour' instead of 'cutscene1', 'test', 'new'"}}]
tellraw @s [{"text":"• Set display names","color":"gray","hover_event":{"action":"show_text","value":"Use display names for user-friendly labels: 'Epic Castle Reveal' is better than 'castle_intro'"}}]
tellraw @s [{"text":"• Test with particles first","color":"gray","hover_event":{"action":"show_text","value":"Always visualize your path with particles before playing the cutscene to catch any issues"}}]
tellraw @s [{"text":"• Backup important cutscenes","color":"gray","hover_event":{"action":"show_text","value":"Save copies of your world before making major changes. Cutscene deletion cannot be undone!"}}]

tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"⬅ Back to Help Menu","color":"gray","click_event":{"action":"run_command","command":"/function dynamic_cutscene:admin/help"},"hover_event":{"action":"show_text","value":"Return to the main help menu"}}]
tellraw @s [{"text":"==================================","color":"blue","bold":true}]