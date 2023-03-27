extends Ball
class_name Player

@export var SPEED_MULTIPLICATION: float = 0.08
@export var available_moves: int = -1

var can_drag: bool = true
var start_drag_pos = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if !can_drag: return
	
	if event is InputEventScreenTouch and round(abs(velocity)) <= Vector2.ONE and (available_moves > 0 or available_moves < 0):
		if event.is_pressed():
			start_drag_pos = event.position
		else:
			direction = -(event.position - start_drag_pos) * SPEED_MULTIPLICATION
			available_moves -= 1
	elif event is InputEventScreenDrag:
		# show dragging line
		pass

func fall(hole_center: Vector2) -> void:
	super(hole_center)
	can_drag = false
