extends Node2D

@export var cardType = "default"
@export var faceUp = false

@onready var backSprite = load("res://Art/Card Back.png")
@onready var sprite = $Sprite2D

var cardFace;

signal clicked(type)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setCardFace()
	Global.turnAllFaceDown.connect(turnFaceDown)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func turnFaceUp():
	if !faceUp and Global.numFaceUpCards < 2:
		print("turning card face up")
		faceUp = true
		sprite.texture = cardFace
		Global.cardClicked.emit(self)

func turnFaceDown():
	if faceUp:
		sprite.texture = backSprite
		faceUp = false

func _on_button_pressed() -> void:
	turnFaceUp()

func setCardFace():
	if cardType == "Diamond":
		cardFace = load("res://Art/Diamond Card.png")
	elif cardType == "Circle":
		cardFace = load("res://Art/Circle Card.png")
	else:
		cardFace = load("res://Art/Square Card.png")
