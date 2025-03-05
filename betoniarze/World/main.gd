extends Node2D

var timer: float = 0
var hide_ui: bool = false

func _ready() -> void:
	Global.IsAlive = true
	Global.is_in_game = true
	get_tree().paused = false

func _process(delta: float) -> void:
	timer = timer + delta
	if timer >= 0.5 and hide_ui == false:
		$"CanvasLayer/Działko_Parowe_UI".visible = true
		$CanvasLayer/Ammunition.visible = true
	
		if Input.is_action_just_pressed("enter") and Global.change == true:
			hide_ui = true
			$"CanvasLayer/Działko_Parowe_UI".visible = false
			$CanvasLayer/Ammunition.visible = false
			$CanvasLayer/Death_Screen.visible = false
			$CanvasLayer/pause_menu.visible = false
			$CanvasLayer/Settings.visible = false
