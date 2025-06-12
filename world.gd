extends Node2D

@export var chip:PackedScene


func _ready() -> void:
	randomize()
	for i in 100:
		await get_tree().create_timer(0.05).timeout
		var ci = chip.instantiate() as RigidBody2D
		ci.position.x = randf_range(564, 607)
		ci.position.y = randf_range(0, 156)
		add_child(ci)
