extends Microgame

@export var slots : PackedScene 
@export var up_but : PackedScene
@export var down_but : PackedScene

var reel1
var reel2
var reel3


var buttons = []

var reels = []

var winners = ["these", "are", "defaults"]

func _ready():
	setup()
	
func setup():
	super()
	
	reel1 = slots.instantiate()
	add_child(reel1)
	var pos = Vector2(321, 569)
	reel1.position = pos
	reels.append(reel1)
	
	reel2 = slots.instantiate()
	add_child(reel2)
	pos = Vector2(560, 569)
	reel2.position = pos
	reels.append(reel2)
	
	reel3 = slots.instantiate()
	add_child(reel3)
	pos = Vector2(799, 569)
	reel3.position = pos
	reels.append(reel3)
	
	for i in range(3): # up buttons
		var b = up_but.instantiate()
		add_child(b)
		pos = Vector2(363 + (240 * i), 229)
		b.position = pos
		b.z_index = 2
		buttons.append(b)
		
	for i in range(3): # down buttons
		var b = down_but.instantiate()
		add_child(b)
		pos = Vector2(363 + (240 * i), 607)
		b.position = pos
		b.z_index = 2
		buttons.append(b)
	
	for i in range(3):
		buttons[i].pressed.connect(raise_slots.bind(reels[i]))
		
	for i in range(3):
		buttons[3 + i].pressed.connect(lower_slots.bind(reels[i]))
	
	
	print(reel1.get_children()[-6].position)
	print(reel1.get_children()[-1].position)
	reel1.get_children()[0].get_children()[0].show()
	#reel1.get_children()[-6].get_children()[0].position = Vector2(0,0)
	

func win_check():
	print("win check run")
	if winners[0] == winners[1] and winners[1] == winners[2]:
		print("you won")


func raise_slots(reel):
	reel.get_children()[reel.up_counter].position.y += 534
	reel.position.y -= 89
	reel.down_counter = reel.up_counter
	reel.up_counter -= 1


func lower_slots(reel):
	reel.get_children()[reel.down_counter].position.y -= 534
	reel.position.y += 89
	print(reel.down_counter)
	reel.up_counter = reel.down_counter
	reel.down_counter += 1


func _on_overlay_winner(area) -> void:
	var current = area.get_child(0) 
	for i in range(reels.size()):
		if area.get_parent().get_parent() == reels[i] and current is Sprite2D:
			var path = current.texture.resource_path
			winners[i] = path
	
	print(winners)
	win_check()

#func loop(reel, index):
	
	
