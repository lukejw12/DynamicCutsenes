tellraw @s [{"text":"\n======= PLAYING CUTSCENES =======","color":"yellow","bold":true}]
tellraw @s [{"text":"Click any command to auto-fill it in chat!","color":"yellow","italic":true}]
tellraw @s [{"text":"","color":"gray"}]

tellraw @s [{"text":"⚡ SPEED PRESETS","color":"gold","bold":true}]
tellraw @s [{"text":"• Ultra Fast (5 ticks)","color":"white","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:cutscene/play_cutscene {speed:5,cutscene_name:\"my_cutscene\"}"},"hover_event":{"action":"show_text","value":"0.25 seconds per point. Use for quick previews or high-speed action sequences."}}]
tellraw @s [{"text":"• Fast (10 ticks)","color":"white","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:cutscene/play_cutscene {speed:10,cutscene_name:\"my_cutscene\"}"},"hover_event":{"action":"show_text","value":"0.5 seconds per point. Good for testing cutscenes quickly or energetic sequences."}}]
tellraw @s [{"text":"• Normal (30 ticks)","color":"white","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:cutscene/play_cutscene {speed:30,cutscene_name:\"my_cutscene\"}"},"hover_event":{"action":"show_text","value":"1.5 seconds per point. Standard speed for most cutscenes. Good balance of pacing and smoothness."}}]
tellraw @s [{"text":"• Slow (60 ticks)","color":"white","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:cutscene/play_cutscene {speed:60,cutscene_name:\"my_cutscene\"}"},"hover_event":{"action":"show_text","value":"3 seconds per point. Perfect for dramatic scenes, detailed shots, or cinematic moments."}}]
tellraw @s [{"text":"• Cinematic (100 ticks)","color":"white","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:cutscene/play_cutscene {speed:100,cutscene_name:\"my_cutscene\"}"},"hover_event":{"action":"show_text","value":"5 seconds per point. Very slow, artistic pacing for emotional or contemplative scenes."}}]

tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"🎭 CUTSCENE TYPES","color":"gold","bold":true}]
tellraw @s [{"text":"• Action Sequence","color":"red","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:cutscene/play_cutscene {speed:15,cutscene_name:\"my_cutscene\"}"},"hover_event":{"action":"show_text","value":"Fast-paced (15 ticks = 0.75 sec per point). Good for combat, explosions, or high-energy moments."}}]
tellraw @s [{"text":"• Dialogue Scene","color":"blue","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:cutscene/play_cutscene {speed:40,cutscene_name:\"my_cutscene\"}"},"hover_event":{"action":"show_text","value":"Medium pace (40 ticks = 2 sec per point). Allows time for conversation while maintaining engagement."}}]
tellraw @s [{"text":"• Scenic Tour","color":"green","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:cutscene/play_cutscene {speed:80,cutscene_name:\"my_cutscene\"}"},"hover_event":{"action":"show_text","value":"Leisurely pace (80 ticks = 4 sec per point). Perfect for showcasing builds or beautiful landscapes."}}]

tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"💡 SPEED TIPS","color":"gold","bold":true}]
tellraw @s [{"text":"• Test fast, play slow","color":"gray","hover_event":{"action":"show_text","value":"Always test your cutscenes with speed:10 first to quickly check the path, then slow down to your final speed."}}]
tellraw @s [{"text":"• Match speed to content","color":"gray","hover_event":{"action":"show_text","value":"Action = Fast (10-20), Normal scenes = Medium (30-50), Dramatic = Slow (60-100)"}}]
tellraw @s [{"text":"• 20 ticks = 1 second","color":"gray","hover_event":{"action":"show_text","value":"Remember: 20 ticks equals 1 real-world second. Use this to time your cutscenes precisely."}}]

tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"⬅ Back to Help Menu","color":"gray","click_event":{"action":"run_command","command":"/function dynamic_cutscene:admin/help"},"hover_event":{"action":"show_text","value":"Return to the main help menu"}}]
tellraw @s [{"text":"=================================","color":"yellow","bold":true}]