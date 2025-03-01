extends Area2D

func Eksplozja():
	pass #to nic nie robi, ale zostaw


func _physics_process(delta):
	for o in get_overlapping_bodies():
		if o is RigidBody2D:
			
			$CPUParticles2D.emitting = true
			var force = (o.global_position - global_position).normalized()
			force *= 200
			o.apply_central_impulse(force)
			
		if  o.has_method("Enemy"):
			$CPUParticles2D_Zabicie.emitting = true
			$CPUParticles2D.emitting = false
			
			o.queue_free()


	
	
