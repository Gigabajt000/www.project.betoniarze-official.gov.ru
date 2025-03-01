extends Area2D

func Eksplozja():
	pass #to nic nie robi, ale zostaw


func _physics_process(delta):
	for o in get_overlapping_bodies():
		if o is RigidBody2D:
			
			$CPUParticles2D.emitting = true
			var force = (o.global_position - global_position).normalized()
			force *= 150
			o.apply_central_impulse(force)
			
		if  o.has_method("Enemy"):
			$CPUParticles2D.emitting = false
			$CPUParticles2D_Zabicie.emitting = true
			o.queue_free()

func _on_timer_timeout():
	
	queue_free()
