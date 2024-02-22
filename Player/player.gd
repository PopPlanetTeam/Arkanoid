extends CharacterBody2D

const SPEED = 300.0

@onready var ball = %Ball

func _physics_process(delta):
	var direction = handle_input()

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	velocity.y = 0.0
	move_and_slide()

func handle_input() -> int:
	if Input.is_key_pressed(KEY_LEFT): return -1
	elif Input.is_key_pressed(KEY_RIGHT): return 1
	return 0 


func _on_area_2d_body_entered(body):
	ball.direction.y *= -1
