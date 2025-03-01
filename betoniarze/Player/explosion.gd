extends Area2D


func _physics_process(delta):
	for o in get_overlapping_bodies():
		if o is RigidBody2D:
			var force = (o.global_position - global_position).normalized()
			force *= 200
			o.apply_central_impulse(force)


func _on_timer_timeout():
	queue_free()
