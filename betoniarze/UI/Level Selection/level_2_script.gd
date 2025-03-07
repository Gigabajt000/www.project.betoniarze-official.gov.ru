extends TextureButton






func _on_pressed():
	if Global.level2 == true:
		FadeIn.transition()
		await FadeIn.on_transition_finished
		Global.IsAlive = true
		get_tree().change_scene_to_file("res://World/Level 2/level_2.tscn")
