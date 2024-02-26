extends CharacterBody2D

const SPEED = 300.0

@onready var ball = %Ball
@onready var sprite = $Texture
@onready var wall_ray_left = $wall_ray_left
@onready var wall_ray_right = $wall_ray_right

func _ready():
	var path = "res://data/info.json"
	var file = FileAccess.open(path, FileAccess.READ)
	var json = JSON.new()
	var dados = json.parse_string(file.get_as_text())
	change_sprite(dados.id)

func _physics_process(delta):
	var direction = handle_input()
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	velocity.y = 0.0
	move_and_slide()

func handle_input() -> int:
	if Input.is_action_pressed("left") and not wall_ray_left.is_colliding(): return -1
	elif Input.is_action_pressed("right") and not wall_ray_right.is_colliding(): return 1
	return 0 
	
	
func change_sprite(sprite_id):
	if sprite_id == 0:
			sprite.texture = preload("res://Menu/player_1.png")
	elif sprite_id == 1:
			sprite.texture = preload("res://Menu/player_2.png")
	elif sprite_id == 2:
			sprite.texture = preload("res://Menu/player_3.png")
	else:
			sprite.texture = preload("res://Menu/player_4.png")


func _on_central_area_body_entered(body):
	ball.direction.y *= -1

func _on_left_area_body_entered(body):
	if ball.velocity.x > 0:
		ball.direction.x *= -1
		
func _on_right_area_body_entered(body):
	if ball.velocity.x < 0:
		ball.direction.x *= -1
