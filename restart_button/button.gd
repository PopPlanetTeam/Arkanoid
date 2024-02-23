extends Button

func _on_pressed():
	print("Pelo menos chamou")
	get_tree().change_scene_to_file("res://Menu/menu.tscn")
