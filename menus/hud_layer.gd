extends CanvasLayer

@export var level_name: String = "Level X"
@export var star_slot: PackedScene

@export var star1: Star
@export var star2: Star
@export var star3: Star

@onready var level_label: Label = $HUD/LevelLabel

@onready var stars: Array[Star] = [star1, star2, star3]
@onready var stars_h_box_container: HBoxContainer = $HUD/StarsHBoxContainer

func _ready() -> void:
	level_label.text = level_name
	for star in stars:
		if star == null:
			continue
		var new_star_slot = star_slot.instantiate()
		new_star_slot.collected = false

		stars_h_box_container.add_child(new_star_slot)
		star.collected.connect(func(): new_star_slot.collected = true)

func get_star_slots() -> Array[StarSlot]:
	var childs: Array[StarSlot] = []
	for child in stars_h_box_container.get_children():
		if child is StarSlot:
			childs.append(child)
	return childs
