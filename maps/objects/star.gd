@tool
extends Node2D
class_name Star

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var move_tween = null

func _ready() -> void:
	sprite_2d.position = Vector2.ZERO
	animation_player.play("moving")

func disapear():
	animation_player.play("collected")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Ball:
		print("ball hit star")
		disapear()
