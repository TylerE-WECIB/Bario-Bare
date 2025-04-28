extends Area2D

var screen_size
var mouse_cur_pos
@export var speed = 400
@export var angle = 90

func _ready():
	screen_size = get_viewport_rect().size
	

func _process(delta):
	mouse_cur_pos = get_viewport().get_mouse_position()
	angle = rad_to_deg(get_angle_to(Vector2(-mouse_cur_pos[0], -mouse_cur_pos[1])))
	
	$cueTip.rotation_degrees = angle
	
	
	#if Input.is_action_pressed("grab") and get_viewport().get_mouse_position() != mouse_cur_pos:
		
	
	
	
	
