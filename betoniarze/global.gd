extends Node

var IsAlive: bool = true

#dzwięk
var master_volume : float = 1
var muted: bool = false


#ammunition
var max_amunicja: int = 100
var amunicja: float = 100

#Camera
var zoom = 0.7

func _process(delta):
	if Global.IsAlive == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if Global.IsAlive == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func Death():
	IsAlive = false
	get_tree().change_scene_to_file("res://UI/Death_Screen/death_screen.tscn")
