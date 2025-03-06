extends RigidBody2D

@export var raycast_dół_lewo: RayCast2D
@export var raycast_dół1_prawo: RayCast2D

var cos3
var cos4
var can_attack: bool = false

var direction = 1
var SPEED = 50

func _ready() -> void:
	linear_velocity.x = SPEED
	direction = 1

func Heavy_Enemy():
	pass #Tego też nie usuwaj

func _process(delta: float) -> void:
	if can_attack == true:
		attack()


func _integrate_forces(state):
	if abs(linear_velocity.x) <= SPEED:
		print(abs(linear_velocity.x))
		var velocity = linear_velocity
		velocity.x = SPEED * direction 
		state.set_linear_velocity(velocity)

func _physics_process(delta: float) -> void:
	
	cos3 = raycast_dół_lewo.get_collider()
	cos4 = raycast_dół1_prawo.get_collider()
	
	
	if abs(linear_velocity.x) > 0 and can_attack == false:
		$AnimatedSprite2D.play("heavy_walk")
		
	if cos3 == null and direction == -1:
		direction = 1
		$AnimatedSprite2D.flip_h = true
		
	elif cos4 == null and direction == 1:
		direction = -1
		$AnimatedSprite2D.flip_h = false


func attack():
	$AnimatedSprite2D.play("heavy_attack")
	if $AnimatedSprite2D.frame >= 10 and can_attack == true:
		Global.Death()
		can_attack = false
	

func _on_area_2d_body_entered(body):
	if body.has_method("Player"):
		can_attack = true
		SPEED = 0

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.has_method("Player"):
		can_attack = false
		SPEED = 50
