extends Node2D

var current_scene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current_scene = get_tree().current_scene
	print(current_scene)
	if Input.is_action_just_pressed("enter") and Global.change == true:
		Global.change = false
		if current_scene and current_scene.filename == "res://World/main.tscn":
			print("a")
			FadeIn.transition()
			await FadeIn._on_animation_finished
			Global.level2 = true



func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.has_method("Player"):
		Global.change = true


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("Player"):
		Global.change = false
