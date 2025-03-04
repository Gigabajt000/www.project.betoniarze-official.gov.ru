extends Node2D

func _ready() -> void:
	Global.IsAlive = true
	Global.is_in_game = true
	get_tree().paused = false
func _process(delta: float) -> void:
	pass
