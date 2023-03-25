extends Node2D
class_name Hole

signal on_screen
signal off_screen

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Ball:
		body.fall(position)


func _on_visible_on_screen_notifier_2d_screen_entered() -> void:
	emit_signal("on_screen")
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	emit_signal("off_screen")
