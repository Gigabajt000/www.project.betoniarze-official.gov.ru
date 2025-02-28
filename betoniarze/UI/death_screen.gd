extends Control



func _on_main_menu_pressed():
	print("x")
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")

	
func _on_settings_pressed():
	get_tree().change_scene_to_file("res://UI/settings.tscn")


func _on_wyjdź_pressed():
	get_tree().quit()
