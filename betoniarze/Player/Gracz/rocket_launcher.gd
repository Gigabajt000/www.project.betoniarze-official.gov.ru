extends Node2D

var bullet_path = preload("res://Player/Gracz/bullet.tscn")

#Timery
var x: float = 0


func _physics_process(delta):
	rotate_launcher()
	
	look_at(get_global_mouse_position())
	x = x - delta
	Global.y = Global.y - delta
	if Input.is_action_just_pressed("shoot") and Global.amunicja >= 50 and x <= 0:
		x = 1
		Global.amunicja = Global.amunicja - 50
		shoot()	
		
	if Input.is_action_just_pressed("push")	and Global.y <= 0:
		Global.y = 3.5
		push()
	
	
@export var particle:CPUParticles2D
	
	
func push():
	var force = ($"Przyszły pocisk".global_position - $"../Srodek_Gracza".global_position).normalized()
	force *= 900
	$"..".linear_velocity = -(force)
	particle.emitting = true
	$explosion_sfx.play(0)

func shoot():
	var bullet = bullet_path.instantiate()
	bullet.direction = global_rotation
	bullet.pos = $"Przyszły pocisk".global_position
	get_parent().add_child(bullet)
	
func rotate_launcher():
	if Global.flip == true:
		$Sprite2D.flip_v = true
		$Sprite2D.position = Vector2(14,0)
		position = Vector2(-3, -7)
	else:
		$Sprite2D.flip_v = false
		$Sprite2D.position = Vector2(14, 0)
		position = Vector2(-13, -7)
	
