extends VBoxContainer

@export var star_slot: PackedScene

@export var star1: Star
@export var star2: Star
@export var star3: Star


@onready var stars: Array[Star] = [star1, star2, star3]
@onready var stars_h_box_container: HBoxContainer = $StarsHBoxContainer

func _ready() -> void:
	for star in stars:
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
