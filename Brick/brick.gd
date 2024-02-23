extends Area2D

signal hit

@onready var game = get_parent()

func _on_body_entered(body):
	body.direction.y *= -1
	#get_parent().remove_child(self)
	queue_free()
	hit.emit()
	game.break_brick()
	game.update_score_label()
