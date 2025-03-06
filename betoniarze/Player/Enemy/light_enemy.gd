extends CharacterBody2D

const SPEED = 70
@export var target : RigidBody2D

@export var raycast_dół_lewo: RayCast2D
@export var raycast_dół1_prawo: RayCast2D

@export var area: Area2D

var attack_speed : float = 1

var area_if_bok
var JUMP_VELOCITY = -240.0

var direction = 0


var can_attack: bool = false
var cos3
var cos4

var temporary_direction = 0

var can_move = true


func Enemy():
	pass #To też nic nie robi, nie wycinaj bo urwe jaja

func attack():
	$Sprite2D.play("light_attack")
	if $Sprite2D.frame >= 10 and can_attack == true:
		Global.Death()
		can_attack = false

func _physics_process(delta: float) -> void:
	
	cos3 = raycast_dół_lewo.get_collider()
	cos4 = raycast_dół1_prawo.get_collider()
	
	if abs(velocity.x) > 0 and can_attack == false:
		$Sprite2D.play("light_walk")
		
	if cos3 == null and direction == -1:
		direction = 1
		$Sprite2D.flip_h = true
		
	elif cos4 == null and direction == 1:
		direction = -1
		$Sprite2D.flip_h = false
	
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
		velocity.x = SPEED * direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.has_method("Player"):
		attack()
