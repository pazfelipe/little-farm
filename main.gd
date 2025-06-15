extends Node2D

var corn_scene = preload("res://scenes/corn.tscn")

func _ready():
	var corn_instance = corn_scene.instantiate()
	corn_instance.position = get_local_mouse_position()
	add_child(corn_instance)
	
