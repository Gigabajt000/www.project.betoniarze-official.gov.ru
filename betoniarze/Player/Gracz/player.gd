extends RigidBody2D

@export var celownik : Sprite2D
@export var srodek: Node2D
var zoom_factor := Vector2(1, 1)

func _process(delta: float) -> void:
	
	player_filp()
	
	camera_zoom()
	Global.original_position = position


func Player():
	pass #Prosze mi tego nie usuwać inaczej utne jaja
	#to jest do kolców btw

func camera_zoom():
	if abs(linear_velocity.x) >= abs(linear_velocity.y):
		zoom_factor = abs(Vector2(linear_velocity.x, linear_velocity.x) / Vector2(2000, 2000))
	if abs(linear_velocity.y) > abs(linear_velocity.x):
		zoom_factor = abs(Vector2(linear_velocity.y, linear_velocity.y) / Vector2(2000, 2000))
	
	zoom_factor = zoom_factor.clamp(Vector2(1.2, 1.2), Vector2(1.5, 1.5))
	var y = Vector2(1.2, 1.2) + (Vector2(1.5, 1.5) - zoom_factor)
	Global.zoom = Global.zoom.move_toward(y, 0.01)

var x : float = 0	
func _physics_process(delta: float) -> void:
	
	if linear_velocity.y < 0:
		gravity_scale = 2
	if linear_velocity.y >= 0:
		gravity_scale = 1
	
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
	
	
	
func player_filp():
	if get_global_mouse_position().x > position.x:
		$"Player Texture".flip_h = false
		$"Player Texture".offset.x = 0
		Global.flip = false
	if get_global_mouse_position().x < position.x:
		$"Player Texture".flip_h = true
		$"Player Texture".offset.x = -16
		Global.flip = true
		
