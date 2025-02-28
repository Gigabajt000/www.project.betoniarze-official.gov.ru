extends CharacterBody2D

@export var speed: float = 800
@export var explosion_range: float = 100
@export var max_explosion_force: float = 800
var shoot_direction: Vector2 = Vector2.ZERO

func _ready():
	velocity = shoot_direction * speed
	
func _physics_process(delta: float) -> void:
	move_and_slide()

func _on_body_entered(body):
	if body.is_in_group("ground"):
		explode()

func explode():
	var explosion = preload("res://Player/explosion.tscn").instantiate()
	explosion.global_position = global_position
	get_parent().add_child(explosion)  # Add explosion effect

	for body in $"Rocket Area2".get_overlapping_bodies():
		if body is CharacterBody2D:
			body.rocket_jump(global_position, max_explosion_force, explosion_range)
	
	queue_free()  # Remove rocket after explosion
