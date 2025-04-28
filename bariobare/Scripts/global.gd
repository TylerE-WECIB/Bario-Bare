extends Node

#list of microgames. will read from microgame folder
var microgame_list := []

func _ready() -> void:
	var dir = DirAccess.open("res://Scenes/Microgames/")
	for files in dir.get_files():
		if files != "default_game.tscn":
			microgame_list.append("res://Scenes/Microgames/"+files)
	
	#debug line to read all of the microgames in the folder
	#print(microgame_list)
# Global variables
var difficulty = 0.0
#comment to ensure the branch works properly
