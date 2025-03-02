extends Area2D

func Eksplozja():
	pass #to nic nie robi, ale zostaw


func _physics_process(delta):
	for o in get_overlapping_bodies():
		if o.has_method("Player"):
			
			if Global.IsAlive == true:
				Global.Death()
			
		if  o.has_method("Enemy"):
			
			$CPUParticles2D_Zabicie.emitting = true
			
			o.queue_free()
