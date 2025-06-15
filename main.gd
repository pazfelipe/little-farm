extends Node2D

var corn_scene = preload("res://scenes/corn.tscn")

func _ready():
	var corn_instance = corn_scene.instantiate()
	corn_instance.position = get_local_mouse_position()
	add_child(corn_instance)
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		var corn_instance = corn_scene.instantiate()
		var farmer = get_node_or_null("farmer")
		if farmer:
			corn_instance.position = farmer.position
			add_child(corn_instance)
