extends CharacterBody2D

var pos: Vector2
var rot: float
var direction: float
var speed = 1000

var can_collide:bool = true

@export var explosion_sfx: AudioStreamPlayer


func _ready():
	global_position = pos
	global_rotation = rot
	
func _physics_process(delta):
	velocity = Vector2(speed,0).rotated(direction)
	move_and_slide()
	

@onready var explosion = preload("res://Player/explosion.tscn")


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	if can_collide == true:
		explosion_sfx.play(0)
		
		$Sprite2D.visible = false
		var explosion_instance = explosion.instantiate()
		explosion_instance.position = body.position
		add_child(explosion_instance)
		can_collide = false
