class_name Game extends Node

@export_file("*.tscn") var levels: Array[String]= [
	"res://level1.tscn",
	"res://level2.tscn"
]
var current_level_index: int = 0

func change_level() -> void:
	current_level_index += 1
	if current_level_index < levels.size():
		var next_level_path = levels[current_level_index]
		get_tree().change_scene_to_file(next_level_path)
		print("Transitioning to: ", next_level_path)
	else:
		print("that's it")
