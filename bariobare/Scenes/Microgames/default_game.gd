extends Node2D

@onready var gameTimer = $GameTimer;
var timeLimit = 5;

func _ready() -> void:
	gameTimer.set_wait_time(timeLimit);

func _process(delta: float) -> void:
	pass


func _on_game_timer_timeout() -> void:
	print("timeout ", gameTimer.get_wait_time());
