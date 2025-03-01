extends Node

var IsAlive: bool = false

#UI
var y: float = 0


#dzwięk
var master_volume: float = 1
var muted: bool = false

var play_zabicie: bool = false

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
	play_zabicie= true
	IsAlive = false
	
