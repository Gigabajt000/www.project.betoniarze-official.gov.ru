extends Control


func _ready() -> void:
	Global.is_in_game = false
	process_mode = PROCESS_MODE_ALWAYS
	
	if Global.first_open == true:
		$AnimationPlayer.play("betoniarze")
		Global.first_open = false
	else:
		$TextureRect.visible = false



func _on_settings_pressed():
	get_tree().change_scene_to_file("res://UI/Settings/main_menu_settings.tscn")


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/Level Selection/level_selection.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
