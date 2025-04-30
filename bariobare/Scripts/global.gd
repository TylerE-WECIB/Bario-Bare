extends Node

# Global variables
var difficulty = 0.0
var lives = 3
var maxLives = 4 # may remove/not implement
var numWins = 0
var highscore = 0
var current_game := "res://Scenes/Microgames/default_game.tscn"
var game_playing := false
#list of microgames. will read from microgame folder
var microgame_list := []

signal startGameTimer
signal winGame
signal loseGame

func _ready() -> void:
	var dir = DirAccess.open("res://Scenes/Microgames/")
	for files in dir.get_files():
		if files != "default_game.tscn":
			microgame_list.append("res://Scenes/Microgames/"+files)
	shuffle_microgame()
	#debug line to read all of the microgames in the folder
	print(microgame_list)

func shuffle_microgame():
	current_game = microgame_list.pick_random()
