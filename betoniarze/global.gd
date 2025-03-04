extends Node

var IsAlive: bool = false
var mouse_shown: bool = true
var is_in_game: bool = false

#UI
var y: float = 0
signal open_settings
signal close_settings


#dzwięk
var master_volume: float = 1
var muted: bool = false

var play_zabicie: bool = false

#ammunition
var max_amunicja: int = 100
var amunicja: float = 100

#Camera
var zoom = Vector2(0.7, 0.7)

#Camera shake
var boom: bool = false
var original_position: Vector2

var level1: bool = true
var level2: bool = false
var level3: bool = false
var level4: bool = false
var level5: bool = false
var level6: bool = false
var level7: bool = false
var level8: bool = false

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS

func _process(delta):
	if mouse_shown == true:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if mouse_shown == false:
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func Death():
	play_zabicie= true
	IsAlive = false
	
