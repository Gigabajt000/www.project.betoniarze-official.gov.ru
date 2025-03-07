extends StaticBody2D

var start_timer: bool = false
var x: float = 0

@onready var explosion = preload("res://Player/Beczka_Wybuchowa/eksplozja_beczki.tscn")

func _process(delta):
	if start_timer == true:
		x = x + delta
	if x >= 0.5:
		$".".queue_free()
	

var emit_sound = true
func _on_area_2d_area_entered(area):
	if emit_sound == true:
		$AudioStreamPlayer.play(0)
		emit_sound = false
		
	if area.has_method("Eksplozja"):
		var explosion_instance = explosion.instantiate()
		add_child(explosion_instance)
		explosion_instance.position = Vector2(0,0)
		
		$CPUParticles2D.emitting = true
		$Sprite2D.visible = false
		start_timer = true
		
		

	
