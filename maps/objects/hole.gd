extends Node2D
class_name Hole

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Ball:
		body.fall(position)
