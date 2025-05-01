extends Control

@export var slot : PackedScene

var sprites = ["apple", "banana", "bear", "cat", "cherries", "seven"]

func _ready():
	randomize()
	sprites.shuffle()
	for i in range(6):
		var s = slot.instantiate()
		add_child(s)
		s.position.y -= i * 89
		s.get_node("Sprite2D").texture = load("res://Art/slotsArt/" + sprites[i] + ".png")
