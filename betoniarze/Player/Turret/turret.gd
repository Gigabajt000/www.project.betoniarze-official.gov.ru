extends StaticBody2D

var deafult_transform
var attacking: bool = false
var timer: float = 0
var look_at_player: bool = false

@export var progress_bar: ProgressBar

var bullet_path = preload("res://Player/Turret/bullet_turret.tscn")
var gracz

func Turret():
	pass

func _process(delta: float) -> void:
	if abs(rotation) >= deg_to_rad(180):
		$Sprite2D.flip_h = true
		$Sprite2D.flip_v = true
	else:
		$Sprite2D.flip_h = false
		$Sprite2D.flip_v = false
	
	if look_at_player == false:
		transform = transform.interpolate_with(deafult_transform, 3 * delta)
	if look_at_player == true and gracz != null:
		look_at(gracz.global_position)
	
	if $RayCast2D.get_collider() is StaticBody2D or $RayCast2D.get_collider() == null:
		attacking = false
		look_at_player = false
	if $RayCast2D.get_collider() is RigidBody2D:
		look_at_player = true

		
	for o in $Wykrywanie.get_overlapping_bodies():
		if o.has_method("Player"):
			gracz = o
			$RayCast2D.look_at(gracz.global_position)
			

func _ready():
	deafult_transform = transform
	progress_bar.max_value = 3
	
	
func _physics_process(delta):
	for o in $Area2D.get_overlapping_bodies():
		if o.has_method("Player"):
			
			attacking = true

		
	progress_bar.value = timer
	
	if attacking == true and not $RayCast2D.get_collider() is StaticBody2D and Global.stun == false:
		timer = timer + delta
	
	if attacking == true and timer >= 3 and not $RayCast2D.get_collider() is StaticBody2D:
		atak()
		timer = 0


func atak():
	var bullet = bullet_path.instantiate()
	bullet.direction = global_rotation
	bullet.pos = $Node2D.global_position
	get_parent().add_child(bullet)

	

func _on_area_2d_body_exited(body):
	if body.has_method("Player"):
		timer = 0
		attacking = false



	
