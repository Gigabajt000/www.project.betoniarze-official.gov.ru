extends Node2D

@export var Drzwi: CollisionObject2D
@export var animation: AnimationPlayer

func _on_area_2d_area_entered(area):
	if area.has_method("Eksplozja"):
		print("entered")
		animation.play("Przycisk")
		Drzwi.collision_layer = 8
	
