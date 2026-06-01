extends Node

@export_file("*.tscn") var levels: Array[String] = [
	"res://Scenes/level1.tscn",
	"res://Scenes/level2.tscn"
]
var current_level_index: int = 0
var current_level_node: Node = null

func _ready() -> void:
	# DO NOT instantiate Level 1 here!
	call_deferred("_grab_initial_scene")

func _grab_initial_scene() -> void:
	#store the Level 1 
	current_level_node = get_tree().current_scene
	current_level_index = 0

func change_level() -> void:
	current_level_index += 1
	if current_level_index < levels.size():
		load_level(current_level_index)
	else:
		print("that's it")

func load_level(index: int) -> void:
	#clean up
	if is_instance_valid(current_level_node):
		current_level_node.queue_free()
		
	var next_level_path = levels[index]
	var level_resource = load(next_level_path)
	
	if level_resource:
		#new lvl
		current_level_node = level_resource.instantiate()
		
		# Add to root and update the tree's current scene
		get_tree().root.add_child(current_level_node)
		get_tree().current_scene = current_level_node
		
		print("Manually transitioned to: ", next_level_path)
		
func reload_level() -> void:
	load_level(current_level_index)
