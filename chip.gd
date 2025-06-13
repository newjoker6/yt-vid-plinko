class_name chip extends RigidBody2D

@export var horizontal_damp: float = 1


func _ready():
	linear_velocity = Vector2(randf_range(-10, 10), 0)
	angular_velocity = randf_range(-50, 50)


func _integrate_forces(state):
	if linear_velocity.y > 0:
		linear_velocity.x *= horizontal_damp
