extends CharacterBody2D

const EXLPOSION_POWER = 100
@export var rocket_scene: PackedScene

func _process(delta: float) -> void:
	pass

func rocket_jump(explosion_position: Vector2, max_explosion_force: float, explosion_range: float):
	var distance = global_position.distance_to(explosion_position)
	
	if distance > explosion_range:
		return
	
	var explosion_strength = (1.0 - (distance / explosion_range)) * max_explosion_force
	var direction = (global_position - explosion_position).normalized()
	
	velocity += direction * explosion_strength

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	move_and_slide()


func shoot():
	if rocket_scene:
		var rocket = rocket_scene.instantiate()
		rocket.global_position = global_position
		rocket.shoot_direction = (get_global_mouse_position() - global_position).normalized()  # Set direction
		get_parent().add_child(rocket)

func _input(event):
	if event.is_action_pressed("shoot"):
		shoot()
