extends Control

@export var slot : PackedScene

var sprites = ["apple", "banana", "bear", "cat", "cherries", "seven"]
var up_counter = 5
var down_counter = 0

func _process(delta: float) -> void:
	if up_counter < 0:
		up_counter = 5
	if down_counter >= 6:
		down_counter = 0

func _ready():
	randomize()
	sprites.shuffle()
	for i in range(6):
		var s = slot.instantiate()
		add_child(s)
		s.position.y -= i * 89
		s.get_node("Area2D").get_node("Sprite2D").texture = load("res://Art/slotsArt/" + sprites[i] + ".png")
