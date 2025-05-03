extends Sprite2D

signal winner

func _on_winners_area_entered(area: Area2D) -> void:
	winner.emit(area) # Replace with function body.
