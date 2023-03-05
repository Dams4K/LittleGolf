@tool
extends StaticBody2D

@export var thickness := Vector4.ONE * 10:
	set(v):
		thickness = v
		if is_inside_tree():
			gen_collisions()

func _ready() -> void:
	get_tree().root.connect("size_changed", _on_viewport_size_changed)
	gen_collisions()

func gen_collisions() -> void:
	for child in get_children():
		child.queue_free()
	
	var pos = [Vector2(0, 0.5), Vector2(0.5, 0), Vector2(1, 0.5), Vector2(0.5, 1)]
	for i in range(4):
		var shape = RectangleShape2D.new()
		if i % 2 == 0:
			shape.size = Vector2(thickness[i], get_viewport_size().y)
		else:
			shape.size = Vector2(get_viewport_size().x, thickness[i])
		
		var collision_shape = CollisionShape2D.new()
		collision_shape.shape = shape
		collision_shape.position = pos[i] * get_viewport_size()
		
		add_child(collision_shape)

func get_viewport_size() -> Vector2:
	return get_tree().root.get_viewport().get_visible_rect().size

func _on_viewport_size_changed() -> void:
	gen_collisions()
