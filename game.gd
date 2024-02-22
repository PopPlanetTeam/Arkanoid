extends Node2D

@onready var player = %Player
@onready var map = %Map
@onready var sprite = get_node("Player/Texture")
# Called when the node enters the scene tree for the first time.
func _ready():
	var loaded_brick = preload("res://Brick/brick.tscn")
	var y_start = 40
	var x_start = 400
	for i in range(0,5):
		for j in range(0, 4):
			var brick = loaded_brick.instantiate()
			brick.position = Vector2(x_start, y_start)
			brick.scale = Vector2(0.8, 0.8)
			self.add_child(brick)
			x_start += 100
		x_start = 400
		y_start += 35
		
	var path = "res://data/info.json"
	var file = FileAccess.open(path, FileAccess.READ)
	var json = JSON.new()
	var dados = json.parse_string(file.get_as_text())
	change_sprite(dados.id)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_sprite(sprite_id):
	if sprite_id == 0:
			sprite.texture = preload("res://Menu/player_1.png")
			print("Sprite ", sprite_id)
	elif sprite_id == 1:
			sprite.texture = preload("res://Menu/player_2.png")
			print("Sprite ", sprite_id)
	elif sprite_id == 0:
			sprite.texture = preload("res://Menu/player_3.png")
			print("Sprite ", sprite_id)
	else:
			sprite.texture = preload("res://Menu/player_4.png")
			print("Sprite ", sprite_id)

