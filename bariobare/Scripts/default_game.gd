extends Node2D
class_name Microgame

@onready var gameTimer = $GameTimer

# level-dependent varaibles

var timeLimit
@export var defaultTimeLimit = 10
@export var minTimeLimit = 5
@export var timeLimitStep = 3 # how much time limit is decreased by based on difficulty
@export var gameTitle = "Default!"; # stores title of the game as a string
@onready var gameActive = true #checks if the game is playing so the bomb doesn't explode frame 1

var winConditionMet = false


func _ready() -> void:
	Global.startGameTimer.connect(_onStartGameTimer)
	setup()

func _process(delta: float) -> void:
	pass

func setup() -> void: # responsible for setting timeLimit and starting the timer
	print("======== setup() ========")
	
	print("1. level-dependent variables (do later)") # set level specific variables here
	print("gameTitle: ", gameTitle)
	print("defaultTimeLimit: ", defaultTimeLimit)
	print("minTimeLimit: ", minTimeLimit)
	print("timeLimitStep: ", timeLimitStep)
	print()
  
	print("2. start GameTimer using setTimeLimit() as argument")


func _on_game_timer_timeout() -> void:
	gameActive = false
	print("======== _on_game_timer_timeout() ========")
	print("Duration in seconds: ", gameTimer.get_wait_time())
	print("winConditionMet: ", winConditionMet)
	
	print()
	
	if winConditionMet:
		Global.winGame.emit()
		gameTimer.stop()
	else:
		Global.loseGame.emit()

func setTimeLimit() -> int: # sets the time limit based on difficulty
	var levelTimeLimit
	print("======== setTimeLimit() ========")
	
	var difficulty = Global.difficulty
	var timeLimitModifier = int(timeLimitStep * difficulty)
	
	print("defaultTimeLimit: ", defaultTimeLimit)
	print("difficulty: ", difficulty)
	print("timeLimitStep: ", timeLimitStep)
	print("timeLimitModifier: ", timeLimitModifier)
	
	levelTimeLimit = defaultTimeLimit - timeLimitModifier
	print("levelTimeLimit: ", levelTimeLimit)
	
	if levelTimeLimit < minTimeLimit:
		print("levelTimeLimit is to small, setting to minTimeLimit: ", minTimeLimit)
		levelTimeLimit = minTimeLimit
	
	print()
	return levelTimeLimit


func _on_lose_game() -> void:
	print("======== _on_lose_game() ========")
	print("You lost")

func _on_win_game() -> void:
	print("======== _on_win_game() ========")
	print("You won")

func _onStartGameTimer():
	gameTimer.start(setTimeLimit())
	print("timer started")
