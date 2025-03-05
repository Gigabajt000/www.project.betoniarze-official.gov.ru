extends Area2D

func Eksplozja():
	pass #to nic nie robi, ale zostaw




func _physics_process(delta):
	
	for o in get_overlapping_bodies():
		if o.has_method("Heavy_Enemy"):
			
			var force = (o.global_position - global_position).normalized()
			force *= Vector2(1200,1500)
			o.linear_velocity += force
			queue_free()
			
		if o.has_method("Player"):
		
			var force = (o.global_position - global_position).normalized()
			force *= 1800
			print(force)
			o.linear_velocity += force
			queue_free()
			
			
		if  o.has_method("Enemy"):
			$CPUParticles2D_Zabicie.emitting = true
			
			
			o.queue_free()
		if  o.has_method("Turret"):
			Global.stun = true


	
	
