extends Control


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://UI/Settings/settings.tscn")


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/Level Selection/level_selection.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
