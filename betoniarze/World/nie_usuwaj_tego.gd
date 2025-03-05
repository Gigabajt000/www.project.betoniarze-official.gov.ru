extends ColorRect

var timer: float = 0

func _process(delta: float) -> void:
	timer += delta
	if timer >= 0.5:
		visible = false
