@tool extends Node2D

@export var peg_scene: PackedScene
@export var row_slider: HSlider
@export var peg_hor_spacing: int = 80
@export var peg_vert_spacing: int = 80
@export var scoring_area_scene: PackedScene

@export_category("Testing")
@export_tool_button("test pegs") var testbtn = _testing
@export_range(1, 10, 1) var testRows:int

func _testing():
	_clear_pegs()
	_spawn_triangle_pegs(testRows+1)

func _ready() -> void:
	_clear_pegs()
	_spawn_triangle_pegs(2)

func _clear_pegs():
	for child in get_children():
		child.queue_free()

func _spawn_triangle_pegs(rows: int):
	var start_y = 0
	
	for row in range(1, rows):
		var num_pegs = row + 1
		var total_width = (num_pegs - 1) * peg_hor_spacing
		var start_x = -total_width / 2
		
		for i in range(num_pegs):
			var peg = peg_scene.instantiate()
			peg.position = Vector2(start_x + i * peg_hor_spacing, start_y + row * peg_vert_spacing)
			add_child(peg)

	var scoring_y = start_y + rows * peg_vert_spacing
	_spawn_scoring_areas(rows + 1, scoring_y)

func _on_h_slider_value_changed(value: float) -> void:
	_clear_pegs()
	_spawn_triangle_pegs(value)

func _spawn_scoring_areas(num: int, y_offset: float):
	var spacing = peg_hor_spacing
	var total_width = (num - 1) * spacing
	var start_x = -total_width / 2
	
	for i in range(num):
		var area = scoring_area_scene.instantiate()
		area.position = Vector2(start_x + i * spacing, y_offset)
		area.body_entered.connect(Callable(area, "_on_body_entered"))
		
		var max_score = 100
		var distance_from_edge = min(i, num - 1 - i)
		var max_distance = (num - 1) / 2.0
		var score = int(round(max_score * (1.0 - float(distance_from_edge) / max_distance)))
		area.pts = score
		
		add_child(area)
