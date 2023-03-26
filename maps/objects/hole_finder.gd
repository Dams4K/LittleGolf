extends Node2D

@export var camera2d: Camera2D
@export var hole: Hole

func _ready() -> void:
	if camera2d == null or hole == null:
		queue_free()
		return
	
#	hole.off_screen.connect(func(): self.visible = true)
#	hole.on_screen.connect(func(): self.visible = false)

func _process(delta: float) -> void:
	var direction = camera2d.global_position.direction_to(hole.global_position)
	var dst_to_hole = camera2d.global_position.distance_to(hole.global_position)
	var dst_x_to_hole = abs(camera2d.global_position.x - hole.global_position.x)
	var dst_y_to_hole = abs(camera2d.global_position.y - hole.global_position.y)
	
#	print(Vector2.LEFT.dot(direction))
#	print(Vector2.UP.dot(direction))
	
	var dst_y_to_edge = get_viewport_rect().size.y / 2
	var dst_x_to_edge = get_viewport_rect().size.x / 2
	var min_xy_dst_to_edge = min(dst_x_to_edge, dst_y_to_edge)
	var max_dst_xy_to_hole = max(dst_x_to_hole, dst_y_to_hole)
#	if abs(Vector2.LEFT.dot(direction)) > abs(Vector2.UP.dot(direction)):
#		min_xy_dst_to_edge = min(dst_x_to_edge, dst_y_to_edge)
	
	var dst_to_edge = dst_to_hole * (min_xy_dst_to_edge/max_dst_xy_to_hole)
	global_position = camera2d.global_position + direction * dst_to_edge
