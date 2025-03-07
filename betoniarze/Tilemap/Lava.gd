extends ColorRect

@export var x: CPUParticles2D

func _on_area_2d_body_entered(body):
	if body.has_method("Player"):
		
		
		Global.Death()
	if body.has_method("Enemy") or body.has_method("Heavy_Enemy"):	
		
		x.position = body.position
		x.emitting = true
		body.queue_free()
