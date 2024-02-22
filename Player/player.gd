extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	var direction = handle_input()

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	velocity.y = 0.0

	move_and_slide()

func handle_input() -> int:
	if Input.is_key_pressed(KEY_LEFT): -1
	elif Input.is_key_pressed(KEY_RIGHT): 1
	return 0 
