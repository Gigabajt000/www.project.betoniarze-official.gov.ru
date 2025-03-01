extends Node2D

@export var pause_menu: Control

func _ready() -> void:
	Global.mouse_shown = false
	Global.is_in_game = true
	Global.is_in_pause_menu = false
	Global.is_in_settings_scene = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("back") and Global.is_in_game == true and Global.is_in_settings_scene == false:
		Global.is_in_pause_menu = true
		Global.mouse_shown = true
