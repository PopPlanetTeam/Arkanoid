extends Area2D

signal hit

func _on_body_entered(body):
	get_parent().remove_child(self)
	queue_free()
	#hit.emit()
