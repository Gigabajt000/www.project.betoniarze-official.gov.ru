extends RigidBody2D


var attacking: bool = true
var timer: float = 0

@export var progress_bar: ProgressBar

var bullet_path = preload("res://Player/Turret/bullet_turret.tscn")

func _ready():
	progress_bar.max_value = 2
	
	
func _physics_process(delta):
	
	progress_bar.value = timer
	
	if attacking == true:
		timer = timer + delta
	
	if attacking == true and timer >= 2:
		atak()
		timer = 0


func atak():
	var bullet = bullet_path.instantiate()
	bullet.direction = global_rotation
	bullet.pos = $Node2D.global_position
	get_parent().add_child(bullet)


func _on_area_2d_body_entered(body):
	if body.has_method("Player"):
		attacking = true


func _on_area_2d_body_exited(body):
	if body.has_method("Player"):
		timer = 0
		attacking = false
