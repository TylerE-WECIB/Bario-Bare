extends Sprite2D

signal shoot

var screen_size
var mouse_cur_pos
@export var angle = 90

func _ready():
	screen_size = get_viewport_rect().size
	

func _physics_process(delta: float):

	if !Input.is_action_pressed("grab"):
		mouse_cur_pos = get_global_mouse_position()
		look_at(mouse_cur_pos)
	
	if Input.is_action_pressed("grab"):
		determine_power(mouse_cur_pos)
	
	
	
func determine_power(mouse):
	var mouse_up_pos = get_global_mouse_position()
	var power = 0
	#if Input.is_action_pressed("grab") and mouse_up_pos != mouse:
		#PathFollow2D.p
