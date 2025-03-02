extends Node

var IsAlive: bool = false
var mouse_shown: bool = true
var is_in_game: bool = false

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

#UI
var is_in_settings_scene: bool = false
var is_in_pause_menu: bool = false

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS

func _process(delta):
	if mouse_shown == true:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if mouse_shown == false:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func Death():
	play_zabicie= true
	IsAlive = false
	
