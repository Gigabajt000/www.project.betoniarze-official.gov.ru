extends Node2D

@export var Drzwi: CollisionObject2D
@export var animation: AnimationPlayer

func _on_area_2d_area_entered(area):
	if area.has_method("Eksplozja"):
		animation.play("Przycisk")
		Drzwi.gunwo = true
		$AudioStreamPlayer.play(0)
