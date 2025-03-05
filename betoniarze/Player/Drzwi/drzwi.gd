extends StaticBody2D

var gunwo: bool


func _process(delta: float) -> void:
	if gunwo == true:
		$AnimatedSprite2D.play("open_door")
		gunwo = false
	
	if $AnimatedSprite2D.frame == 12:
		collision_layer = 8
