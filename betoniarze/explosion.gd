extends Area2D

@export var explosion_radius: float = 150
@export var max_explosion_force: float = 1000


func _ready() -> void:
	$"Remove Explosion Timer".start()
	for body in get_overlapping_bodies():
		if body is CharacterBody2D:
			body.rocket_jump(global_position, max_explosion_force, explosion_radius)

func _on_timer_timeout():
	queue_free()
