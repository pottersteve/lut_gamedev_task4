class_name Coin extends Area2D

var current_count
var won: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_to_group("coins")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	if body is Player and not won:
		remove_from_group("coins")
		queue_free()
		var coins_remaining = get_tree().get_node_count_in_group("coins")
		print("There are ", coins_remaining, " instances remaining!")
		if coins_remaining <= 0:
			_end_level()

func _end_level():
	won = true
	print("the end")
	GameStructure.call_deferred("change_level")
