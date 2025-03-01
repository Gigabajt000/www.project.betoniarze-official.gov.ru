extends Node

var IsAlive: bool = true

#dzwięk
var master_volume : float = 1
var muted: bool = false

#ammunition
var max_amunicja: int = 100
var amunicja: int = 100

func Death():
	get_tree().change_scene_to_file("res://UI/death_screen.tscn")
