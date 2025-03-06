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
var zoom = Vector2(1.5, 1.5)

#Camera shake
var boom: bool = false
var original_position: Vector2

var stun : bool = false

var level1: bool = true
var level2: bool = true
var level3: bool = true
var level4: bool = true
var level5: bool = false
var level6: bool = false
var level7: bool = true
var level8: bool = false

var change:bool

#flip character
var flip: bool = false

func _ready() -> void:
	process_mode = PROCESS_MODE_ALWAYS
	zoom = Vector2(2, 2)
	
var timer: float = 0

func _process(delta):
	
	if stun == true:
		timer = timer + delta
	if stun == true and timer >= 2:
		timer = 0
		stun = false
	if mouse_shown == true:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	if mouse_shown == false:
		Input.mouse_mode = Input.MOUSE_MODE_HIDDEN

func Death():
	play_zabicie= true
	IsAlive = false
	
