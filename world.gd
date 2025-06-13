extends Node2D

@export var Chip:PackedScene
var chipCount: int = 0
var centreBias: float = 0.0


func _ready() -> void:
	randomize()


func SpawnBalls() -> void:
	for i in chipCount:
		await get_tree().create_timer(0.05).timeout
		var ci = Chip.instantiate() as chip
		ci.position.x = randf_range(564, 607)
		ci.position.y = randf_range(0, 156)
		ci.horizontal_damp = centreBias
		add_child(ci)


func _on_button_pressed() -> void:
	SpawnBalls()


func _on_h_slider_value_changed(value: float) -> void:
	centreBias = value


func _on_chip_counter_slider_value_changed(value: float) -> void:
	chipCount = value
