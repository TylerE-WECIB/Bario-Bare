extends Node

<<<<<<< HEAD
#list of microgames. will read from microgame folder
var microgame_list := []

func _ready() -> void:
	var dir = DirAccess.open("res://Scenes/Microgames/")
	for files in dir.get_files():
		if files != "default_game.tscn":
			microgame_list.append("res://Scenes/Microgames/"+files)
	
	#debug line to read all of the microgames in the folder
	#print(microgame_list)
=======
# Global variables
var difficulty = 0.0
>>>>>>> 4da8031b386a9a336e148e1e200fa6e38813bb88
