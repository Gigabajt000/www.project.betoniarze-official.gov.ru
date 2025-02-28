extends RigidBody2D

@export var speed: float = 800
@export var explosion_range: float = 100
@export var max_explosion_force: float = 800

func _ready():
	linear_velocity = transform.x * speed  # Launch the rocket

func _on_body_entered(body):
	explode()

func explode():
	for body in $"Rocket Area".get_overlapping_bodies():
		if body is CharacterBody2D:
			body.rocket_jump(global_position, max_explosion_force, explosion_range)
	
	queue_free()  # Remove rocket after explosion
