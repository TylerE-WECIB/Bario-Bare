extends Node2D

var speed = 250
var direction = Vector2(1,0)
var movement = direction * speed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _physics_process(delta: float) -> void:
	position += movement * delta
	
	if position.x >= 1350: # delete off-screen targets
		print("Deleting an off-screen target")
		self.queue_free()
