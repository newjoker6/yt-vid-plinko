extends Area2D

@export var pts: int = 0



func _on_body_entered(body: Node2D) -> void:
	if body is RigidBody2D:
		print(pts)
