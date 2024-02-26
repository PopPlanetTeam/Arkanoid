extends CharacterBody2D

@export var direction = Vector2.ZERO;
@export var speed = 300;

func _ready():
	speed = 300
	direction.x = [1,-1].pick_random()
	direction.y = -1

func _physics_process(delta):
	if direction:
		velocity = direction * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed)
		
	rotation += 0.3
	
	move_and_slide()    
