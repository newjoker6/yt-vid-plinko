extends Area2D

@export var pts: int = 0


func _on_body_entered(body: PhysicsBody2D) -> void:
	if body is chip:
		print(pts)
