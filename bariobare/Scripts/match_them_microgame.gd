extends Microgame

# asset scenes
@onready var cardScene = PackedScene

# node variables
@onready var cardPositions = $CardPositions # parent node to 6 markers which the cards will be placed on
@onready var cards = $Cards # parent node to the 6 cards
# level-specific variables
var numFaceUpCards = 0 # number of face up cards
var card1 = null
var card2 = null
@onready var cardSpaces = cardPositions.get_children()

# This will be a card matching mememory game with 3 pairs of face down cards
# Click a card to reveal it, 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func setup():
	super()
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
