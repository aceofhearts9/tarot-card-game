extends Node2D

signal hovered
signal hovered_off

var hand_position
var card_slot_card_is_in

var ability_script

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# All cards must be a child of CardManager or this will error
	get_parent().connect_card_signals(self)

func show_ability_text():
	$Ability.visible = true
	$AbilityBackground.visible = true

func hide_ability_text():
	$Ability.visible = false
	$AbilityBackground.visible = false

func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self)

func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self)


func _on_show_ability_area_mouse_entered() -> void:
	show_ability_text()


func _on_show_ability_area_mouse_exited() -> void:
	hide_ability_text()
