extends Node2D

@export var type = "default"
@export var faceUp = false

@onready var sprite = $Sprite2D
@onready var label1 = $Label1 # temporary, will be removed when card sprites are added
@onready var label2 = $Label2 # temporary, will be removed when card sprites are added

signal clicked(type)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label1.set_text(type)
	label2.set_text("Face up? " + str(faceUp))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func updateFace():
	if faceUp:
		faceUp = false
	else:
		faceUp = true
	label2.set_text("Face up? " + str(faceUp))


func _on_button_pressed() -> void:
	updateFace()
