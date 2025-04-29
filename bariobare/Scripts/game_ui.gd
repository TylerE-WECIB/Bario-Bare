extends Node2D

var current_game
var timer
var score := 0
func _ready() -> void:
	_on_microgame_start()
	#$AnimationPlayer.play("fuse_test")
	$"Score Label".text = "Score :" + str(score)
	$Bario.visible = false
	$"Score Label".visible = false

func _physics_process(delta: float) -> void:
	$Bomb/Spark.global_position = $Bomb/Path2D/PathFollow2D.global_position
	$Bomb/Fuse.value = timer.time_left
	$Bomb/Path2D/PathFollow2D.progress_ratio = timer.time_left / $Bomb/Fuse.max_value
	$Bomb/Spark.rotation += 1
	
	#print($Bomb/Fuse.value, timer.time_left)
	$Bomb/Label.text = str(int(timer.time_left))
	if $Bomb/Fuse.value == 0:
		$Bomb.frame = 1
		$Bomb.z_index = 0
		$Bomb/Label.visible = false
		$Bomb/Spark.visible = false
	else:
		$Bomb.frame = 0
		$Bomb.z_index = 5
		$Bomb/Label.visible = true
		$Bomb/Spark.visible = true

func _on_microgame_start():
	current_game = load(Global.current_game).instantiate()
	$GameLoader.add_child(current_game)
	timer = current_game.gameTimer
	$Bomb/Fuse.max_value = timer.wait_time
	$"Game Text".text = current_game.gameTitle
	$AnimationPlayer.play("next_game")


	
	

func increment_score():
	score += 1
	$"Score Label".text = "Score :" + str(score)
	

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "next_game":
		Global.emit_signal("startGameTimer")
