extends Node

# Global variables
var difficulty = 0.0
var lives = 3
var maxLives = 4 # may remove/not implement
var numWins = 0
var highscore = 0
var current_game := "res://Scenes/Microgames/win_big.tscn"
var game_playing := false
#list of microgames. will read from microgame folder
var microgame_list := []

signal startGameTimer
signal winGame
signal loseGame

# level-specific signals and variables between microgame and asset scenes
signal turnAllFaceDown # For MATCH THEM
signal cardClicked(card) # For MATCH THEM
@export var numFaceUpCards = 0 # For MATCH THEM, number of face up cards

func _ready() -> void:
	var dir = DirAccess.open("res://Scenes/Microgames/")
	for files in dir.get_files():
		if files != "default_game.tscn":
			microgame_list.append("res://Scenes/Microgames/"+files.trim_suffix(".remap"))
	#debug line to read all of the microgames in the folder
	print(microgame_list)

func shuffle_microgame():
	current_game = microgame_list.pick_random()
	print(current_game)
