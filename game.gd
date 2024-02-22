extends Node2D

@export var brick_scene: PackedScene
@export var num_bricks: int = 50
@export var brick_height: int = 20
@export var brick_width: int
@export var grid_margin: int = 50
var bricks: Array

@onready var player = %Player
var score: int

var screen_size: Vector2i
@onready var map = %Map

# Called when the node enters the scene tree for the first time.
func _ready():
	screen_size = get_window().size
	new_game()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func new_game():
	score = 0
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
	#generate_brick_grid()

func generate_brick_grid() -> void:
	var max_bricks_per_row: int = (screen_size.x - 2 * grid_margin) / brick_width
	print(max_bricks_per_row)
	for i in range(num_bricks):
		generate_brick(Vector2((i % max_bricks_per_row) * brick_width + grid_margin, int(i / max_bricks_per_row) * brick_height + grid_margin))

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

