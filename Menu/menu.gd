extends Node2D

@onready var pad_1 = get_node("player_1")
@onready var pad_2 = get_node("player_2")
@onready var pad_3 = get_node("player_3")
@onready var pad_4 = get_node("player_4")
# Called when the node enters the scene tree for the first time.

var pad_texture = 0

func _on_player_1_pressed():
	pad_texture = 0
	_on_start_pressed()

func _on_player_2_pressed():
	pad_texture = 1
	_on_start_pressed()

func _on_player_3_pressed():
	pad_texture = 2
	_on_start_pressed()

func _on_player_4_pressed():
	pad_texture = 3
	_on_start_pressed()

func _on_start_pressed():
	var cena_principal = preload("res://game.tscn")  #trocar aqui a cena principal
	#get_tree().change_scene_to_file("res://levels/teste.tscn")
	var json = JSON.new()
	var path = "res://data/info.json"   #trocar aqui o caminho para o json
	var data = {"id": pad_texture}
	var file = FileAccess.open(path, FileAccess.WRITE)
	file.store_string((json.stringify(data)))
	file.close()
	file = null
	
	get_tree().change_scene_to_packed(cena_principal)



