extends CharacterBody2D

var pos: Vector2
var rot: float
var direction: float
var speed = 1000

var set_time = false

func _ready():
	global_position = pos
	global_rotation = rot
	
func _physics_process(delta):
	velocity = Vector2(speed,0).rotated(direction)
	move_and_slide()
	if set_time == true:
		timer(delta)

@onready var explosion = preload("res://Player/explosion.tscn")


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	set_time = true
	$Sprite2D.visible = false
	var explosion_instance = explosion.instantiate()
	explosion_instance.position = body.position
	add_child(explosion_instance)
	
var x: float = 0
func timer(y: float):
	x = x + y
	if x >= 0.2:
		queue_free()
