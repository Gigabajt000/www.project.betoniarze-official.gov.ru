extends GridContainer


func _process(delta: float) -> void:
	var viewport_width = get_viewport_rect().size.x
	var x = viewport_width / 4 - $"Level 1".size.x
	add_theme_constant_override("h_separation", int(x))
	
	var viewport_height = get_viewport_rect().size.y
	var y = viewport_height / 3 - $"Level 1".size.y
	add_theme_constant_override("v_separation", int(y))
