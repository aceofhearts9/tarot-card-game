class_name CardSlotSpread
extends Node2D

const CARD_SLOT_SCENE_PATH = "res://Scenes/card_slot.tscn"

var card_slots = [[0, 1, 0], [1, 1, 1], [0, 1, 0]]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in card_slots.size():
		for j in card_slots[i].size():
			if card_slots[i][j] == 1:
				# Add card slot at this index
				var card_slot_scene = preload(CARD_SLOT_SCENE_PATH)
				var new_card_slot = card_slot_scene.instantiate()
				# TODO
				new_card_slot.position = Vector2(x, y)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
