extends Node2D

var current_game
var timer
var score := 0
var bomb_exploded := false
func _ready() -> void:
	microgame_start()
	
	Global.winGame.connect(_onWinGame)
	Global.loseGame.connect(_onLoseGame)
	#$AnimationPlayer.play("fuse_test")
	$"Score Label".text = "Score: " + str(score)
	$"Lives Label".text = "Lives: " + "[img]res://Art/Heart.png[/img]".repeat(Global.lives)
	$Bario.visible = false
	$"Score Label".visible = false
	$"Lives Label".visible = false
	$Bomb.visible = false

func _physics_process(delta: float) -> void:
	$Bomb/Fuse.value = timer.time_left
	$Bomb/Path2D/PathFollow2D.progress_ratio = timer.time_left / $Bomb/Fuse.max_value
	$Bomb/Spark.rotation += 1
	if timer.time_left > 0:
		$Bomb/Spark.global_position = $Bomb/Path2D/PathFollow2D.global_position
	
	#print($Bomb/Fuse.value, timer.time_left)
	if timer.time_left > 0:
		$Bomb/Label.text = str(int(ceil(timer.time_left)))
	else:
		$Bomb/Label.text = str(int(timer.wait_time))
	if $Bomb/Fuse.value == 0 and not current_game.gameActive and $Bomb.visible:
		$Bomb.frame = 1
		$Bomb.z_index = 0
		$Bomb/Label.visible = false
		$Bomb/Spark.visible = false
		play_explosion()
	else:
		$Bomb.frame = 0
		$Bomb.z_index = 5
		$Bomb/Label.visible = true
		$Bomb/Spark.visible = true

func microgame_start():
	print("next game starting")
	$Bomb.visible = false
	bomb_exploded = false
	Global.shuffle_microgame()
	current_game = load(Global.current_game).instantiate()
	for child in $GameLoader.get_children():
		child.queue_free()
	$GameLoader.add_child(current_game)
	current_game.gameTimer.wait_time = current_game.setTimeLimit()
	timer = current_game.gameTimer
	$Bomb/Fuse.max_value = timer.wait_time
	$"Game Text".text = current_game.gameTitle
	$Bomb/Label.text = str(int(timer.wait_time))
	$Bomb/Fuse.value = timer.wait_time
	$Bomb/Path2D/PathFollow2D.progress_ratio = timer.time_left / $Bomb/Fuse.max_value
	$Bomb/Label.text = str(int(ceil(timer.time_left)))
	if Global.lives > 0:
		$AnimationPlayer.queue("next_game")
	else:
		$"Game Text".text = "GAME OVER :("
		$AnimationPlayer.queue("game_over")


func play_explosion():
	if not bomb_exploded:
		$Bomb/AudioStreamPlayer.play()
		bomb_exploded = true
	

func increment_score():
	score += 1
	Global.difficulty += score / 2
	$"Score Label".text = "Score :" + str(score)

func decrement_lives():
	Global.lives -= 1
	$"Lives Label".text = "Lives: " + "[img]res://Art/Heart.png[/img]".repeat(Global.lives)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "next_game":
		#Global.emit_signal("startGameTimer")
		current_game._onStartGameTimer() #i wanted this to be signal based but whatever
		$Bomb/Fuse.max_value = timer.wait_time
		$Bomb.visible = true
	if anim_name == "game_over":
		if score > Global.highscore:
			Global.highscore = score
		get_tree().change_scene_to_file("res://title_screen.tscn")

func _onWinGame():
	print("Game Won!")
	timer.paused = true
	#await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("bario_win")
	#microgame_start()
	

func _onLoseGame():
	print("Game Lost :(")
	timer.paused = true
	#await get_tree().create_timer(1).timeout
	$AnimationPlayer.play("bario_lose")
	#microgame_start()
