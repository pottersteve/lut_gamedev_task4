extends Node

@export_file("*.tscn") var levels: Array[String] = [
	"res://Scenes/level1.tscn",
	"res://Scenes/level2.tscn"
]
var current_level_index: int = 0

func change_level() -> void:
	current_level_index += 1
	if current_level_index < levels.size():
		var next_level_path = levels[current_level_index]
		get_tree().change_scene_to_file(next_level_path) #method said in moodle that doesn't work rip
		print("Transitioning to: ", next_level_path)
	else:
		print("that's it")

		
func reload_level() -> void:
	get_tree().reload_current_scene()
