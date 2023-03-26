@tool
extends Control
class_name StarSlot

@export var collected: bool:
	set(v):
		collected = v
		_ready()
		if collected:
			collect_animation()

@onready var star_texture: TextureRect = $StarTexture

func _ready() -> void:
	star_texture.visible = false
	star_texture.scale = Vector2.ZERO

func collect_animation():
	star_texture.visible = true
	var tween = create_tween()
	tween.tween_property(star_texture, "scale", Vector2.ONE, 0.6).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BOUNCE)
