extends Camera2D


var shake_intensity = 1.0
var shake_duration = 0.0
var shake_timer = 0.0


func _ready():
	Global.original_position = position
	zoom = Vector2(3, 3)
	
func _process(delta):
	zoom = Global.zoom
	if Global.IsAlive == true:
		position = $"../Player".position
	else:
		pass
	
	#Camera shake
	if shake_duration > 0:
		shake_timer -= delta
		if shake_timer <= 0:
			shake_duration = 0

		var shake_offset = Vector2(randf_range(-shake_intensity, shake_intensity), randf_range(-shake_intensity, shake_intensity))
		position = Global.original_position + shake_offset
	else:
		position = Global.original_position
		
	if Global.boom == true:
		trigger_shake(7, 0.7)
		Global.boom = false

func trigger_shake(intensity: float, duration: float):
	shake_intensity = intensity
	shake_duration = duration
	shake_timer = duration
