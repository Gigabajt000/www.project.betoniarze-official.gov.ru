extends Control


@export var progress_bar1: TextureProgressBar
@export var progress_bar2: TextureProgressBar

func _ready():
	progress_bar1.max_value = (1/2) * Global.max_amunicja
	progress_bar2.max_value = (1/2) * Global.max_amunicja

func _process(delta):
	progress_bar1.value = Global.amunicja
	progress_bar2.value = Global.amunicja - (1/2 * Global.max_amunicja)
	
	if Global.amunicja < Global.max_amunicja:
		Global.amunicja += 1
