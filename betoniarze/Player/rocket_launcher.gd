extends Node2D



var bullet_path = preload("res://Player/bullet.tscn")

func _physics_process(delta):
	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot") and Global.amunicja >= 50:
		
		Global.amunicja = Global.amunicja - 50
		shoot()	
	
func shoot():
	var bullet = bullet_path.instantiate()
	bullet.direction = rotation
	bullet.pos = $"Przyszły pocisk".global_position
	bullet.rot = global_rotation
	get_parent().add_child(bullet)
