extends Node2D

@export var camera2d: Camera2D
@export var hole: Hole

func _ready() -> void:
	if camera2d == null or hole == null:
		queue_free()
		return
	
	hole.off_screen.connect(func(): self.visible = true)
	hole.on_screen.connect(func(): self.visible = false)

func _process(delta: float) -> void:
	position = camera2d.global_position
