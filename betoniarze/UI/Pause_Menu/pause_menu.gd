extends Control

func _process(delta: float) -> void:
	if Global.is_in_pause_menu == true:
		visible = true
		get_tree().paused = true
	else:
		visible = false


func _ready() -> void:
	visible = false
	Global.mouse_shown = true
	process_mode = PROCESS_MODE_ALWAYS

func _on_resume_pressed() -> void:
	Global.is_in_pause_menu = false
	Global.mouse_shown = false
	get_tree().paused = false


func _on_settings_pressed() -> void:
	Global.is_in_settings_scene = true
	Global.is_in_pause_menu = false
	visible = false


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/Main_Menu/main_menu.tscn")
