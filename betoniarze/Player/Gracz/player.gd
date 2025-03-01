extends RigidBody2D

@export var celownik : Sprite2D


func Player():
	pass #Prosze mi tego nie usuwać inaczej utne jaja
	#to jest do kolców btw


		
func _physics_process(delta: float) -> void:
	celownik.position = get_local_mouse_position()
	
