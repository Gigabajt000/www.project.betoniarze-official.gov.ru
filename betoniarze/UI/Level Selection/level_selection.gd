extends Control

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("back"):
		get_tree().change_scene_to_file("res://UI/Main_Menu/main_menu.tscn")

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS

func _on_level_1_pressed() -> void:
	if Global.level1 == true:
		FadeIn.transition()
		await FadeIn.on_transition_finished
		Global.IsAlive = true
		get_tree().change_scene_to_file("res://World/Level 1/level_1.tscn")
	

func _on_level_3_pressed() -> void:
	if Global.level3 == true:
		FadeIn.transition()
		await FadeIn.on_transition_finished
		get_tree().change_scene_to_file("res://World/Level 3/level_3.tscn")
		Global.IsAlive = true


func _on_level_4_pressed() -> void:
	if Global.level4 == true:
		FadeIn.transition()
		await FadeIn.on_transition_finished
		get_tree().change_scene_to_file("res://World/Level 4/level_4.tscn")
		Global.IsAlive = true


func _on_level_5_pressed() -> void:
	if Global.level5 == true:
		FadeIn.transition()
		await FadeIn.on_transition_finished
		get_tree().change_scene_to_file("res://World/Level 5/level_5.tscn")
		Global.IsAlive = true


func _on_level_6_pressed() -> void:
	if Global.level6 == true:
		FadeIn.transition()
		await FadeIn.on_transition_finished
		get_tree().change_scene_to_file("res://World/Level 6/level_6.tscn")
		Global.IsAlive = true


func _on_level_7_pressed() -> void:
	if Global.level7 == true:
		FadeIn.transition()
		await FadeIn.on_transition_finished
		get_tree().change_scene_to_file("res://World/Level 7/level_7.tscn")
		Global.IsAlive = true


func _on_level_8_pressed() -> void:
	if Global.level8 == true:
		FadeIn.transition()
		await FadeIn.on_transition_finished
		get_tree().change_scene_to_file("res://World/Level 8/level_8.tscn")
		Global.IsAlive = true


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/Main_Menu/main_menu.tscn")
