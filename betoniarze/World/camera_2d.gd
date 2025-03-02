extends Camera2D


func _process(delta):
	zoom = Global.zoom
	if Global.IsAlive == true:
		position = $"../Player".position
	else:
		pass
