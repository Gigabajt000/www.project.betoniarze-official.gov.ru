extends StaticBody2D

var gunwo: bool


func _process(delta: float) -> void:
	if gunwo == true:
		$AnimatedSprite2D.play("open_door")
		collision_layer = 8
		gunwo = false
