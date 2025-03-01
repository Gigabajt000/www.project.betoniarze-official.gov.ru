extends Control

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS

func _on_level_1_pressed() -> void:
	get_tree().change_scene_to_file("res://World/main.tscn")
	Global.IsAlive = true


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://UI/Main_Menu/main_menu.tscn")
