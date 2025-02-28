extends Control

func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://UI/main_menu.tscn")


func _on_h_slider_value_changed(value):
	if Global.muted == false:
		AudioServer.set_bus_volume_db(0, linear_to_db(value))
	Global.master_volume = value


func _on_check_box_toggled(toggled_on):
	if toggled_on == true:
		AudioServer.set_bus_volume_db(0, linear_to_db(0))
		AudioServer.set_bus_volume_db(1, linear_to_db(0))
		AudioServer.set_bus_volume_db(2, linear_to_db(0))
		Global.muted = true
	else:
		Global.muted = false
