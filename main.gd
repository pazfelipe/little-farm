extends Node2D

var corn_scene = preload("res://scenes/corn.tscn")
var current_plot: Node = null

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action") and current_plot and current_plot.is_allowed_to_plant:
		var corn_instance = corn_scene.instantiate()
		var farmer = get_node_or_null("farmer")
		if farmer:
			corn_instance.position = farmer.global_position
			add_child(corn_instance)
