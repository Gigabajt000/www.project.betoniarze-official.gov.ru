extends Control




func _on_settings_pressed():
	get_tree().change_scene_to_file("res://UI/settings.tscn")


func _on_button_pressed():
	get_tree().change_scene_to_file("res://World/main.tscn")
