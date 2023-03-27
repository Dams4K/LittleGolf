extends Ball
class_name Player

@export var SPEED_MULTIPLICATION: float = 0.08

var can_drag: bool = true
var start_drag_pos = Vector2.ZERO

func _input(event: InputEvent) -> void:
	if !can_drag: return
	
	if event is InputEventScreenTouch and round(abs(velocity)) <= Vector2.ONE:
		if event.is_pressed():
			start_drag_pos = event.position
		else:
			direction = -(event.position - start_drag_pos) * SPEED_MULTIPLICATION
			print("+1 move")
	elif event is InputEventScreenDrag:
		# show dragging line
		pass

func fall(hole_center: Vector2) -> void:
	super(hole_center)
	can_drag = false
