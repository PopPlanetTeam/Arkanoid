extends Node2D

@onready var player = %Player
@onready var map = %Map
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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
