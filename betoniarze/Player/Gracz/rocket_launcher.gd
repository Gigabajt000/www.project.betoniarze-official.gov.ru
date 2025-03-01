extends Node2D

var bullet_path = preload("res://Player/Gracz/bullet.tscn")

#Timery
var x: float = 0
var y: float = 0

func _physics_process(delta):
	look_at(get_global_mouse_position())
	x = x - delta
	y = y - delta
	if Input.is_action_just_pressed("shoot") and Global.amunicja >= 50 and x <= 0:
		x = 1
		Global.amunicja = Global.amunicja - 50
		shoot()	
		
	if Input.is_action_just_pressed("push")	and y <= 0 and x <= 0:
		y = 1.7
		push()
	
	
@export var particle:CPUParticles2D
	
	
func push():
	var force = ($"Przyszły pocisk".global_position - global_position).normalized()
	force *= 1200
	$"..".linear_velocity = -(force)
	particle.emitting = true
	$explosion_sfx.play(0)

func shoot():
	var bullet = bullet_path.instantiate()
	bullet.direction = global_rotation
	bullet.pos = $"Przyszły pocisk".global_position
	get_parent().add_child(bullet)
