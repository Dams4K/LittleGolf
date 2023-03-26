@tool
extends Node2D
class_name Star

signal collected

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var collision_shape_2d: CollisionShape2D = $Area2D/CollisionShape2D

var move_tween = null

func _ready() -> void:
	sprite_2d.position = Vector2.ZERO
	animation_player.play("moving")

func disapear():
	animation_player.play("collected")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Ball:
		collected.emit()
		disapear()
