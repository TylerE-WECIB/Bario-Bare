extends Sprite2D

signal shoot

var power : float = 0.0
const MAX_POWER : float = 6.0

func _physics_process(delta: float):
	var mouse_pos
	$Label.hide()
	if !Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		mouse_pos = get_viewport().get_mouse_position()
		look_at(mouse_pos)
	
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		$Label.show()
		$Label.text = str(power)
		$Label.add_theme_font_size_override("font_size", 20 + (power * 10))
		
		if power >= MAX_POWER:
			power = MAX_POWER
		else:
			
			power += .1
	else:
		if power > 0:
			var direction = mouse_pos - position
			shoot.emit(power * direction)
			power = 0
