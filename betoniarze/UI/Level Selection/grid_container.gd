extends GridContainer


func _process(delta: float) -> void:
	var viewport_width = get_viewport_rect().size.x
	var x = viewport_width / 3 - $"Level 1".size.x 
	add_theme_constant_override("h_separation", int(x))
	
	var viewport_height = get_viewport_rect().size.y
	var y = viewport_height / 3 - $"Level 1".size.y 
	add_theme_constant_override("v_separation", int(y))

	if Global.level1 == true:
		$"Level 1/Sprite2D".visible = false
	if Global.level2 == true:
		$"Level 2/Sprite2D".visible = false
	if Global.level3 == true:
		$"Level 3/Sprite2D".visible = false
	if Global.level4 == true:
		$"Level 4/Sprite2D".visible = false
	if Global.level5 == true:
		$"Level 5/Sprite2D".visible = false
	if Global.level6 == true:
		$"Level 6/Sprite2D".visible = false
