extends Node

@export_file("*.tscn") var levels: Array[String] = [
	"res://Scenes/level1.tscn",
	"res://Scenes/level2.tscn"
]
var current_level_index: int = 0
var current_level_node: Node = null

func _ready() -> void:
	load_level(current_level_index)



func change_level() -> void:
	current_level_index += 1
	if current_level_index < levels.size():
		load_level(current_level_index)
		#var next_level_path = levels[current_level_index]
		#get_tree().change_scene_to_file(next_level_path) #method said in moodle that doesn't work rip
		#print("Transitioning to: ", next_level_path)
	else:
		print("that's it")

func load_level(index: int) -> void:
	if current_level_node and is_instance_valid(current_level_node):
		current_level_node.queue_free() #cleanup
		
	var next_level_path = levels[index]
	var level_scene = load(next_level_path)
	
	if level_scene:
		current_level_node = level_scene.instantiate()
		call_deferred("add_child", current_level_node)
		print("Transitioning to: ", next_level_path)
		
func reload_level() -> void:
	load_level(current_level_index)
