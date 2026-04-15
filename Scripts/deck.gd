extends Node2D

const CARD_SCENE_PATH = "res://Scenes/card.tscn"
const CARD_DRAW_SPEED = 0.2

const PLAYER_MAX_HAND_SIZE = 2

var player_deck = ["the_hanged_man", "the_hanged_man", "the_hanged_man", "the_hanged_man"]

var card_database_reference

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	card_database_reference = preload("res://Scripts/card_database.gd")
	#for card_id in card_database_reference.CARDS:
		#if card_database_reference.CARDS[card_id][2] == "Major":
			#player_deck.append(card_id)
	player_deck.shuffle()
	$RichTextLabel.text = str(player_deck.size())

func draw_card():
	var card_drawn = player_deck[0]
	player_deck.erase(card_drawn)
	
	if player_deck.size() == 0:
		$Area2D/CollisionShape2D.disabled = true
		$Sprite2D.visible = false
		$RichTextLabel.visible = false
	
	$RichTextLabel.text = str(player_deck.size())
	var card_scene = preload(CARD_SCENE_PATH)
	var new_card = card_scene.instantiate()
	var card_image_path = str("res://Sprites/Cards/" + 
		card_database_reference.CARDS[card_drawn][2] + 
		"/" + card_drawn + ".png")
	new_card.get_node("CardImage").texture = load(card_image_path)
	new_card.get_node("Ability").text = card_database_reference.CARDS[card_drawn][4]
	new_card.get_node("Name").text = card_database_reference.CARDS[card_drawn][0]
	var new_card_ability_script_path = card_database_reference.CARDS[card_drawn][3]
	if new_card_ability_script_path:
		new_card.ability_script = load(new_card_ability_script_path).new()
	$"../CardManager".add_child(new_card)
	new_card.name = "Card"
	$"../PlayerHand".add_card_to_hand(new_card, CARD_DRAW_SPEED)
