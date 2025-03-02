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
	if can_collide == true:
		velocity = Vector2(speed,0).rotated(direction)
		move_and_slide()
	if can_collide == false:
		velocity = Vector2.ZERO
@onready var explosion = preload("res://Player/Gracz/explosion.tscn")


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):

	if can_collide == true :
		can_collide = false
		
		
		Global.boom = true
		explosion_sfx.play(0)
		$Sprite2D.visible = false
		var explosion_instance = explosion.instantiate()
		add_child(explosion_instance)
		explosion_instance.position = Vector2(0,0)
		
		
	


func _on_timer_timeout():
	queue_free()
