extends Microgame

# asset scenes
@onready var cardScene = PackedScene

# node variables
@onready var cardPositions = $CardPositions # parent node to 6 markers which the cards will be placed on
@onready var cards = $Cards # parent node to the 6 cards

# level-specific variables
var numFaceUpCards = 0 # number of face up cards
var matchesMade = 0
var matchesNeeded = 3
var cardsInPlay = 6
var card1 = null
var card2 = null
@onready var cardSpacesArray = cardPositions.get_children()
@onready var cardArray = cards.get_children()

# This will be a card matching mememory game with 3 pairs of face down cards
# Click a card to reveal it, 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup()

func setup():
	super()
	print("3. connect Global.cardClicked and place cards")
	Global.cardClicked.connect(processCards)
	matchesMade = 0
	placeCards()
	print()

func placeCards():
	print("======== placeCards() ========")
	
	cardArray.shuffle()
	cardSpacesArray.shuffle()
	
	print("shuffled cardArray and cardSpacesArray")
	
	for i in range(cardArray.size()):
		var card = cardArray[i]
		var pos = cardSpacesArray[i]
		card.position = pos.position
		print(card.name, " placed on ", pos.name, " at ", pos.position)
	
	print()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func processCards(card):
	print("======== processCards(card) ========")
	
	numFaceUpCards += 1
	
	print("The card you clicked was a ", card.cardType, " card")
	print("There are ", numFaceUpCards, " face up card(s)")
	
	if card1 == null:
		print("selected first card")
		card1 = card
	else:
		print("selected second card")
		card2 = card
	
	print()
	
	if numFaceUpCards != 2:
		return
	else:
		await get_tree().create_timer(1.0).timeout
		print("card1 is a ", card1.cardType, ", card2 is a ", card2.cardType)
		if card1.cardType != card2.cardType:
			print("two cards are face up but are not the same type")
			print()
			
			resetCards()
		else:
			print("the two face up cards are the same type")
			print()
			
			removeMatchingCards()
	
	if matchesMade == matchesNeeded:
		print("You Win!")
		Global.winGame.emit()

func removeMatchingCards():
	print("======== removeMatchingCards() ========")
	
	card1.queue_free()
	card2.queue_free()
	
	print("removing selected cards because they the same type")
	print()
	
	incrementMatches()
	resetCards()

func resetCards():
	print("======== resetCards() ========")
	
	Global.turnAllFaceDown.emit()
	numFaceUpCards = 0
	card1 = null
	card2 = null
	
	print("reseting card variables and turning any face up cards face down")
	print()

func incrementMatches():
	print("======== incrementMatches() ========")
	
	matchesMade += 1
	cardsInPlay -= 2
	
	print(matchesMade, " of 3 match(es) have been made")
	print(cardsInPlay, " of 6 cards remain")
	print()

func _on_game_timer_timeout():
	super()
