extends Node2D

var current_plot: Area2D = null

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("action") and current_plot:
		current_plot.try_plant()
		current_plot.try_harvest()
