extends Control

func _process(delta):
	if Global.IsAlive == false:
		visible = true
		Global.mouse_shown = true
	if Global.IsAlive == true:
		visible = false
		Global.mouse_shown = false

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://UI/Main_Menu/main_menu.tscn")


func _on_wyjdź_pressed():
	get_tree().quit()
