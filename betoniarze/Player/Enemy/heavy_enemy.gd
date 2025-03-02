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

func Heavy_Enemy():
	pass #Tego też nie usuwaj

func _physics_process(delta: float) -> void:
	
	cos3 = raycast_dół_lewo.get_collider()
	cos4 = raycast_dół1_prawo.get_collider()
	

	if cos3 == null and can_move == true:
		direction = 1
	if cos4 == null  and can_move == true:
		direction = -1
	
	
	if direction:
		linear_velocity.x = SPEED * direction
	else:
		linear_velocity.x = move_toward(linear_velocity.x, 0, SPEED)

func attack():
	Global.Death()
	
	#animated_sprite.play("attack")
	

func _on_area_2d_body_entered(body):
	if body.has_method("Player"):
		attack()
