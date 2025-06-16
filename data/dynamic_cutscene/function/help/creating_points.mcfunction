tellraw @s [{"text":"\n======= CREATING CUTSCENE POINTS =======","color":"green","bold":true}]
tellraw @s [{"text":"Click any command to auto-fill it in chat!","color":"yellow","italic":true}]
tellraw @s [{"text":"","color":"gray"}]

tellraw @s [{"text":"🎯 BASIC POINT CREATION","color":"gold","bold":true}]
tellraw @s [{"text":"• No Interpolation","color":"white","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:positions/set_position {cutscene_name:\"my_cutscene\",amount:0,interpolate:\"none\"}"},"hover_event":{"action":"show_text","value":"Creates a single cutscene point at your current position and rotation. The camera will instantly jump to this point during playback."}}]

tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"📈 LINEAR INTERPOLATION","color":"gold","bold":true}]
tellraw @s [{"text":"• Light Smoothing (3 points)","color":"white","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:positions/set_position {cutscene_name:\"my_cutscene\",amount:3,interpolate:\"line\"}"},"hover_event":{"action":"show_text","value":"Creates 3 intermediate points between this and the previous point. Good for subtle smoothing with minimal performance impact."}}]
tellraw @s [{"text":"• Normal Smoothing (5 points)","color":"white","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:positions/set_position {cutscene_name:\"my_cutscene\",amount:5,interpolate:\"line\"}"},"hover_event":{"action":"show_text","value":"Creates 5 intermediate points for smooth straight-line movement. Perfect balance of smoothness and performance."}}]
tellraw @s [{"text":"• Ultra Smooth (10 points)","color":"white","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:positions/set_position {cutscene_name:\"my_cutscene\",amount:10,interpolate:\"line\"}"},"hover_event":{"action":"show_text","value":"Creates 10 intermediate points for very smooth movement. Use for important dramatic shots."}}]

tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"🌊 CURVE INTERPOLATION","color":"gold","bold":true}]
tellraw @s [{"text":"• Y-Curve (Arcing Motion)","color":"white","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:positions/set_position {cutscene_name:\"my_cutscene\",amount:5,interpolate:\"curve_y\"}"},"hover_event":{"action":"show_text","value":"Camera follows a parabolic arc upward between points. Perfect for dramatic reveals, flying shots, or sweeping overhead movements."}}]
tellraw @s [{"text":"• X-Curve (Side Motion)","color":"white","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:positions/set_position {cutscene_name:\"my_cutscene\",amount:5,interpolate:\"curve_x\"}"},"hover_event":{"action":"show_text","value":"Camera follows a stepped curve along the X-axis. Great for sweeping side-to-side movements or circling around subjects."}}]
tellraw @s [{"text":"• Z-Curve (Depth Motion)","color":"white","click_event":{"action":"suggest_command","command":"/function dynamic_cutscene:positions/set_position {cutscene_name:\"my_cutscene\",amount:5,interpolate:\"curve_z\"}"},"hover_event":{"action":"show_text","value":"Camera follows a stepped curve along the Z-axis. Perfect for approaching subjects or dramatic retreat shots."}}]

tellraw @s [{"text":"","color":"gray"}]
tellraw @s [{"text":"⬅ Back to Help Menu","color":"gray","click_event":{"action":"run_command","command":"/function dynamic_cutscene:admin/help"},"hover_event":{"action":"show_text","value":"Return to the main help menu"}}]
tellraw @s [{"text":"=======================================","color":"green","bold":true}]