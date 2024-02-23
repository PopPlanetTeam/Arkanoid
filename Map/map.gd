extends Node2D

@onready var ball = %Ball
@onready var player = %Player

signal player_lost

func _on_top_body_entered(body):
	ball.direction.y *= -1
	
func _on_bottom_body_entered(body):
	ball.global_position = player.global_position + Vector2(0, 10)
	ball.direction = Vector2(randf_range(0.25, 0.75), randf_range(0.25, 1.0)).normalized()
	player_lost.emit()
	get_tree().change_scene_to_file("res://game_over/game_over.tscn")
	
func _flip_ball_horizontally(body):
	ball.direction.x *= -1
