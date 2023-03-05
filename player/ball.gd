extends CharacterBody2D
class_name Ball

const FALL_DURATION: float = 0.25

@export var FRICTION: float = 100.0
@export var direction: Vector2 = Vector2.ZERO:
	set(v):
		direction = v
		velocity = v

func _physics_process(delta: float) -> void:
	velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	var collision = move_and_collide(velocity)
	if collision != null:
		direction = velocity.bounce(collision.get_normal())

func fall(hole_center: Vector2) -> void:
	print("fall")
	velocity = Vector2.ZERO
	var tween = get_tree().create_tween()
	tween.parallel().tween_property(self, "scale", Vector2.ONE * 0.75, FALL_DURATION).set_trans(Tween.TRANS_BOUNCE).set_ease(Tween.EASE_OUT)
	tween.parallel().tween_property(self, "position", hole_center, FALL_DURATION).set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_OUT)
	tween.play()
