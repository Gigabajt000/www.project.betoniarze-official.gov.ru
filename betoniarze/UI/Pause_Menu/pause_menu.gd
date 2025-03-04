extends Control

var is_in_pause_menu: bool = false
var is_in_settings: bool = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("back") and is_in_pause_menu == false and is_in_settings == false:
		is_in_pause_menu = true
		Global.mouse_shown = true
		visible = true
		get_tree().paused = true
	elif Input.is_action_just_pressed("back") and is_in_pause_menu == true and is_in_settings == false:
		is_in_pause_menu = false
		Global.mouse_shown = false
		visible = false
		get_tree().paused = false
	elif Input.is_action_just_pressed("back") and is_in_settings == true:
		is_in_settings = false
		visible = true
	
	await Global.close_settings
	is_in_settings = false
	visible = true
		


func _ready() -> void:
	visible = false
	process_mode = PROCESS_MODE_ALWAYS

func _on_resume_pressed() -> void:
	is_in_pause_menu = false
	Global.mouse_shown = false
	visible = false
	get_tree().paused = false


func _on_settings_pressed() -> void:
	visible = false
	is_in_settings = true
	Global.open_settings.emit()


func _on_main_menu_pressed() -> void:
	FadeIn.transition()
	await FadeIn.on_transition_finished
	get_tree().change_scene_to_file("res://UI/Main_Menu/main_menu.tscn")
