extends Node2D

var speed = 250

signal hitThemTargetHit
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	var direction = Vector2(1,0)
	var movement = direction * speed
	
	position += movement * delta
