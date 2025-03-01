extends Control

func _ready() -> void:
	Global.is_in_game = false
	process_mode = PROCESS_MODE_ALWAYS

func _on_settings_pressed():
	get_tree().change_scene_to_file("res://UI/Settings/settings.tscn")


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/Level Selection/level_selection.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
