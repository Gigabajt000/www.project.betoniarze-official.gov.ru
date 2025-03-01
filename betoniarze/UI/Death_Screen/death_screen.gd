extends Control

func _process(delta):
	if Global.IsAlive == false:
		$".".visible = true
	if Global.IsAlive == true:
		$".".visible = false

func _on_main_menu_pressed():
	print("x")
	get_tree().change_scene_to_file("res://UI/Main_Menu/main_menu.tscn")

	
func _on_settings_pressed():
	get_tree().change_scene_to_file("res://UI/Settings/settings.tscn")


func _on_wyjdź_pressed():
	get_tree().quit()
