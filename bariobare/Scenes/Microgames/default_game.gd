extends Node2D

@onready var gameTimer = $GameTimer;
var timeLimit = 30

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func _on_game_timer_timeout() -> void:
	print("timeout ", gameTimer.get_time_left())
