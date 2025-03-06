extends Control

@export var sound_slider: HSlider
@export var is_muted: CheckBox

func _physics_process(delta: float) -> void:
	await Global.open_settings
	visible = true
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("back"):
		visible = false

func _ready() -> void:
	visible = false
	sound_slider.value = Global.master_volume
	is_muted.button_pressed = Global.muted
	process_mode = PROCESS_MODE_ALWAYS

func _on_back_pressed() -> void:
	visible = false
	Global.close_settings.emit()

func _on_h_slider_value_changed(value):
	Global.master_volume = sound_slider.value
	if Global.muted == false:
		AudioServer.set_bus_volume_db(0, linear_to_db(value))

func _on_check_box_toggled(toggled_on):
	AudioServer.set_bus_mute(0, toggled_on)
	Global.muted = toggled_on
	if toggled_on == false:
		AudioServer.set_bus_volume_db(0, linear_to_db(Global.master_volume))

func _on_fullscreen_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
