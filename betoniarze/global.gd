extends Node

var IsAlive: bool = true

func _process(delta):
	if IsAlive == false:
		Death()

func Death():
	get_tree().change_scene_to_file("res://UI/death_screen.tscn")
