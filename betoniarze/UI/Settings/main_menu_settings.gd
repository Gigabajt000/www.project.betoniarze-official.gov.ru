extends Control

@export var sound_slider: HSlider
@export var is_muted: CheckBox

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("back"):
		get_tree().change_scene_to_file("res://UI/Main_Menu/main_menu.tscn")

func _ready() -> void:
	visible = true
	sound_slider.value = Global.master_volume
	is_muted.button_pressed = Global.muted
	process_mode = PROCESS_MODE_ALWAYS


func _on_main_menu_pressed():
	get_tree().change_scene_to_file("res://UI/Main_Menu/main_menu.tscn")
	
func _on_sound_slider_value_changed(value: float) -> void:
	Global.master_volume = sound_slider.value
	if Global.muted == false:
		AudioServer.set_bus_volume_db(0, linear_to_db(value))

func _on_check_box_toggled(toggled_on):
	AudioServer.set_bus_mute(0, toggled_on)
	Global.muted = toggled_on
	if toggled_on == false:
		AudioServer.set_bus_volume_db(0, linear_to_db(Global.master_volume))
