extends Control


func _ready():
	$ColorRect2.hide()
	$ColorRect3.hide()
	$BigBs/BigB1.play()
	$BigBs/BigB2.play()
	$BigBs/BigB3.play()
	$BigBs/BigB4.play()
	$"High Score".text = "High Score: " + str(Global.highscore)
	Global.lives = 3

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		$Transition.play("Start")
		await $Transition.animation_finished
		get_tree().change_scene_to_file("res://Scenes/game_ui.tscn")
