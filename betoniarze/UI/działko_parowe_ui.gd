extends Control

@export var progress_bar: TextureProgressBar

func _ready():
	progress_bar.max_value = 3.5
	progress_bar.value = 3.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_bar.value = Global.y
