extends CharacterBody2D


var pos: Vector2
var rot: float
var direction: float
var speed = -2000

var can_collide:bool = true

@export var explosion_sfx: AudioStreamPlayer


func _ready():
	global_position = pos
	global_rotation = rot
	
func _physics_process(delta):
	velocity = Vector2(speed,0).rotated(direction)
	move_and_slide()
	

func _on_area_2d_body_entered(body):
	if body.has_method("Player"):
		Global.Death()
		queue_free()
	if body == CollisionShape2D and body.has_method("Player") == false:
		queue_free()
