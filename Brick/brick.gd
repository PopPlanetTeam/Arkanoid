extends Area2D

signal hit

func _on_body_entered(body):
	hit.emit()
	get_parent().remove_child(self)
