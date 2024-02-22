extends CharacterBody2D

const SPEED = 300.0

@onready var ball = %Ball
@onready var sprite = $Texture

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
	if Input.is_key_pressed(KEY_LEFT): return -1
	elif Input.is_key_pressed(KEY_RIGHT): return 1
	return 0 


func _on_area_2d_body_entered(body):
	ball.direction.y *= -1
	
func change_sprite(sprite_id):
	if sprite_id == 0:
			sprite.texture = preload("res://Menu/player_1.png")
			print("Sprite ", sprite_id)
	elif sprite_id == 1:
			sprite.texture = preload("res://Menu/player_2.png")
			print("Sprite ", sprite_id)
	elif sprite_id == 2:
			sprite.texture = preload("res://Menu/player_3.png")
			print("Sprite ", sprite_id)
	else:
			sprite.texture = preload("res://Menu/player_4.png")
			print("Sprite ", sprite_id)
