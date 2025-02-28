extends Control



func _on_wyjdź_pressed():
	get_tree().quit()


func _on_zagraj_ponownie_pressed():
	get_tree().change_scene_to_file("res://World/main.tscn")


func _on_main_menu_pressed():
	pass # Replace with function body.
