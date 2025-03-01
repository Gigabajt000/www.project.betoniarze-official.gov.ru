extends CharacterBody2D

const SPEED = 100
@export var target : RigidBody2D

@export var raycast_dół_lewo: RayCast2D
@export var raycast_dół1_prawo: RayCast2D

@export var area: Area2D

var attack_speed : float = 1

var area_if_bok
var JUMP_VELOCITY = -240.0

var direction = 0



var cos3
var cos4

var temporary_direction = 0

var can_move = true

@export var animated_sprite : AnimatedSprite2D

func Enemy():
	pass #To też nic nie robi, nie wycinaj bo urwe jaja

func attack():
	Global.Death()
	velocity.x = 0
	#animated_sprite.play("attack")
	


func animation():
	if velocity.x > 0:
		pass
		#animated_sprite.play("walk")
		#animated_sprite.flip_h = false
		#animated_sprite.offset.x = 0
	elif velocity.x < 0:
		pass
		#animated_sprite.play("walk")
		#animated_sprite.flip_h = true
		#animated_sprite.offset.x = -10
	elif velocity.x == 0:
		#animated_sprite.play("idle")
		pass

func _process(delta: float) -> void:
	animation()


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
		velocity.x = SPEED * direction
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	if not is_on_floor():
		velocity += get_gravity() * delta

	move_and_slide()


func _on_area_2d_body_entered(body):
	if body.has_method("Player"):
		attack()
