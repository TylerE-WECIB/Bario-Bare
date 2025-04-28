extends Node2D

@onready var gameTimer = $GameTimer;
var timeLimit; # passed into gameTimer.set_wait_time()
var defaultTimeLimit = 30; # level dependent
var minTimeLimit = 10; # level dependent
var timeLimitStep = 3; # how much time limit is decreased by based on difficulty, level dependent

signal winGame
signal loseGame

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func _on_game_timer_timeout() -> void:
	print("timeout ", gameTimer.get_wait_time());

func setTimeLimit(): # sets the time limit based on difficulty
	print("======== setTimeLimit() ========");
	
	var difficulty = Global.difficulty;
	var timeLimitModifier = int(timeLimitStep * difficulty);
	
	print("defaultTimeLimit: ", defaultTimeLimit);
	print("difficulty: ", difficulty);
	print("timeLimitStep: ", timeLimitStep);
	print("timeLimitModifier: ", timeLimitModifier);
	
	timeLimit = defaultTimeLimit - timeLimitModifier;
	print("timeLimit: ", timeLimit)
	
	if timeLimit < minTimeLimit:
		print("timeLimit to small, setting to minTimeLimit: ", minTimeLimit)
		timeLimit = timeLimit;
	
	print()
