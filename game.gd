extends Node2D

@export var brick_scene: PackedScene
@export var num_bricks: int = 50
@export var brick_height: int = 20
@export var brick_width: int = 100
@export var grid_margin: int = 10
var bricks: Array

@onready var player = %Player
var score: int

var screen_size: Vector2i
@onready var map = %Map

# Called when the node enters the scene tree for the first time.
func _ready():
	"""
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
	"""
	screen_size = get_window().size
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func new_game():
	score = 0
	generate_brick_grid()

func generate_brick_grid() -> void:
	var max_bricks_per_row: int = screen_size.x / brick_width
	for i in range(num_bricks):
		generate_brick(Vector2((i % max_bricks_per_row) * brick_width, int(i / max_bricks_per_row) * brick_height))

func generate_brick(pos: Vector2) -> void:
	var brick = brick_scene.instantiate()
	brick.position = pos
	brick.hit.connect(break_brick)
	add_child(brick)
	bricks.append(brick)
	
func break_brick():
	# increment score
	score += 1
	
func update_score_label():
	#$score_label.text = str(score)
	pass

