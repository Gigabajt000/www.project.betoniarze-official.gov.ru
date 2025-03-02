extends RigidBody2D

@export var raycast_dół_lewo: RayCast2D
@export var raycast_dół1_prawo: RayCast2D
@export var target : RigidBody2D

var cos2
var cos3
var cos4

var temporary_direction = 0
var direction
var can_move = true
var SPEED = 60

func _physics_process(delta: float) -> void:
	
	cos3 = raycast_dół_lewo.get_collider()
	cos4 = raycast_dół1_prawo.get_collider()
	
	
	
	if cos3 == null and temporary_direction > 0 :
		can_move = false
	if cos4 == null and temporary_direction < 0 :
		can_move = false
		
	if cos3 == null and temporary_direction < 0 :
		can_move = true
	if cos4 == null and temporary_direction > 0:
		can_move = true

	if Global.IsAlive == true:
		temporary_direction = (target.position.x - position.x)
	
	if can_move == false:
		direction = 0
	if temporary_direction > 15 and can_move == true:
		direction = 1
	if temporary_direction < -15 and can_move == true:
		direction = -1
	
	
	if direction:
		linear_velocity.x = SPEED * direction
	else:
		linear_velocity.x = move_toward(linear_velocity.x, 0, SPEED)
