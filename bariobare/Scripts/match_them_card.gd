extends Node2D

@export var cardType = "default"
@export var faceUp = false

@onready var sprite = $Sprite2D
@onready var label1 = $Label1 # temporary, will be removed when card sprites are added
@onready var label2 = $Label2 # temporary, will be removed when card sprites are added

signal clicked(type)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label1.hide()
	label1.set_text(cardType)
	label2.set_text("Face Down")
	Global.turnAllFaceDown.connect(turnFaceDown)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func turnFaceUp():
	if !faceUp:
		print("turning card face up")
		faceUp = true
		label1.show()
		label2.set_text("Face up")
		Global.cardClicked.emit(self)

func turnFaceDown():
	if faceUp:
		faceUp = false
		label1.hide()
		label2.set_text("Face Down")

func _on_button_pressed() -> void:
	turnFaceUp()
