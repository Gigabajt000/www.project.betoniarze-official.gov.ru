extends Camera2D



func _process(delta):
	if Global.IsAlive == true:
		position = $"../Player".position
	else:
		pass
