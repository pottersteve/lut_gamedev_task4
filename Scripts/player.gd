class_name Player extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -250.0

var GRAVITY := float(ProjectSettings.get_setting("physics/2d/default_gravity"))

func _physics_process(delta: float) -> void:
	#outside
	if position.y > 1500:
		_end_level()
		
	#left right
	if Input.is_action_pressed("LEFT"):
		$AnimatedSprite2D.flip_h = false
	if Input.is_action_pressed("RIGHT"):
		$AnimatedSprite2D.flip_h = true
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("SPACE") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("LEFT", "RIGHT")
	if direction:
		$AnimatedSprite2D.play("run")
		velocity.x = direction * SPEED
	else:
		$AnimatedSprite2D.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	#violent vira
	#breaking benjamin
	#papa roach
	#bullet for my valentine
	
func _end_level():
	print("the end")
	GameStructure.call_deferred("reload_level")
