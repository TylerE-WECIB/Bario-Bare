extends Control


func _ready():
	$BigBs/BigB1.play()
	$BigBs/BigB2.play()
	$BigBs/BigB3.play()
	$BigBs/BigB4.play()

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene_to_file("res://Scenes/game_ui.tscn")
