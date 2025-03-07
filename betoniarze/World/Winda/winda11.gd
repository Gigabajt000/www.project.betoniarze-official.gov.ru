extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("enter") and Global.change == true:
		Global.change = false
		FadeIn.transition()
		await FadeIn.on_transition_finished
		Global.level2 = true
		get_tree().change_scene_to_file("res://World/Level 2/level_2.tscn")


func _on_area_2d_body_entered(body):
	if body.has_method("Player"):
		Global.change = true
		$AnimatedSprite2D.play("open")


func _on_area_2d_body_exited(body):
	if body.has_method("Player"):
		Global.change = false
		$AnimatedSprite2D.play("close")
