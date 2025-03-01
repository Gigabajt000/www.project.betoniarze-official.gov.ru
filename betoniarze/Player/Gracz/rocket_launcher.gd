extends Node2D

var bullet_path = preload("res://Player/Gracz/bullet.tscn")

var x: float = 0

func _physics_process(delta):
	look_at(get_global_mouse_position())
	x = x - delta
	if Input.is_action_just_pressed("shoot") and Global.amunicja >= 50 and x <= 0:
		x = 1
		Global.amunicja = Global.amunicja - 50
		shoot()	
	
func shoot():
	var bullet = bullet_path.instantiate()
	bullet.direction = global_rotation
	bullet.pos = $"Przyszły pocisk".global_position
	get_parent().add_child(bullet)
