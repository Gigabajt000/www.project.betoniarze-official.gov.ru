extends Node2D

@export var level: int

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("enter") and Global.change == true:
		Global.change = false
		match (level):
			1:
				FadeIn.transition()
				await FadeIn.on_transition_finished
				Global.level2 = true
				get_tree().change_scene_to_file("res://World/Level 2/level_2.tscn")
			2:
				FadeIn.transition()
				await FadeIn.on_transition_finished
				print("a")
				Global.level3 = true
				get_tree().change_scene_to_file("res://World/Level 3/level_3.tscn")
			3:
				FadeIn.transition()
				await FadeIn.on_transition_finished
				Global.level4 = true
				get_tree().change_scene_to_file("res://World/Level 4/level_4.tscn")
			4:
				FadeIn.transition()
				await FadeIn.on_transition_finished
				Global.level5 = true
				get_tree().change_scene_to_file("res://World/Level 5/level_5.tscn")
			5:
				FadeIn.transition()
				await FadeIn.on_transition_finished
				Global.level6 = true
				get_tree().change_scene_to_file("res://World/Level 6/level_6.tscn")
			6:
				FadeIn.transition()
				await FadeIn.on_transition_finished
				Global.level7 = true
				get_tree().change_scene_to_file("res://UI/Win Scrin.tscn")
			
				



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("Player"):
		Global.change = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("Player"):
		Global.change = false
