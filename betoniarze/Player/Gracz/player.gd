extends RigidBody2D

@export var celownik : Sprite2D


func Player():
	pass #Prosze mi tego nie usuwać inaczej utne jaja
	#to jest do kolców btw


var x : float = 0	
func _physics_process(delta: float) -> void:
	celownik.position = get_local_mouse_position()
	if Global.play_zabicie == true:
		$CPUParticles2D_Zabicie.emitting = true
		$Zabicie_sfx.play(0)
		Global.play_zabicie = false
	if Global.IsAlive == false:
		#Animacja Smierci trzeba zrobic tutaj
		
		x = x + delta
		if x >= 1:
			queue_free()
