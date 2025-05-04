extends ColorRect


func _ready() -> void:
	hide()


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "window":
		show() # Replace with function body.


func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.name == "window":
		hide() # Replace with function body.
