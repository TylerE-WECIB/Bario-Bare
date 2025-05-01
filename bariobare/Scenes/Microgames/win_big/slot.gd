extends ColorRect

func _ready() -> void:
	hide()
	$Sprite2D/RigidBody2D.mouse_entered.connect(show_slot())
	
func show_slot():
	print("show")
	show()




func _on_rigid_body_2d_mouse_entered():
	print("hello")
	show_slot() # Replace with function body.
