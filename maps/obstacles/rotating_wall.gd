extends AnimatableBody2D

@export var height: float = 250.0
@export var radius: float = 15.0
@export var rotation_speed: float = 50.0
@export_range(0.0, 360.0, 0.01, "degrees") var initial_rotation_degrees: float = 0

@export var color: Color

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var polygon_2d: Polygon2D = $Polygon2D

func _ready() -> void:
	rotation_degrees = initial_rotation_degrees
	
	collision_shape_2d.shape.height = height
	collision_shape_2d.shape.radius = radius
	queue_redraw()
	print(height)
	print(radius)
	collision_shape_2d.shape.height = height
	collision_shape_2d.shape.radius = radius
	print(collision_shape_2d.shape.height)
	print(collision_shape_2d.shape.radius)

func _process(delta: float) -> void:
	rotation_degrees = fmod(rotation_degrees + rotation_speed * delta, 360)

func _draw() -> void:
	var pos = Vector2(-radius, -height/2 + radius)
	var size = Vector2(radius*2, height-radius*2)
	draw_rect(Rect2(pos, size), color)
	
	draw_circle(Vector2(0, -height/2 + radius), radius, color)
	draw_circle(Vector2(0, height/2 - radius), radius, color)
