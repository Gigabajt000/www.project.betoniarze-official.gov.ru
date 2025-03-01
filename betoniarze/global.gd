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

func Death():
	
	get_tree().change_scene_to_file("res://UI/death_screen.tscn")
