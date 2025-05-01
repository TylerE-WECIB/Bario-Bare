extends Microgame

@export var slots : PackedScene 

var reel1
var reel2
var reel3

var selected = []

func _ready():
	setup()
	
func setup():
	super()
	
	reel1 = slots.instantiate()
	add_child(reel1)
	var pos = Vector2(386, 513)
	reel1.position = pos
	
	reel2 = slots.instantiate()
	add_child(reel2)
	pos = Vector2(625, 513)
	reel2.position = pos
	
	reel3 = slots.instantiate()
	add_child(reel3)
	pos = Vector2(864, 513)
	reel3.position = pos
	
	print(reel1.get_children())
