extends Area2D

var is_allowed_to_plant: bool = false

func _on_body_entered(body: Node2D) -> void:
	if body.name == "farmer":
		is_allowed_to_plant = true
		get_tree().get_root().get_node("Main").current_plot = self

func _on_body_exited(body: Node2D) -> void:
	if body.name == "farmer":
		is_allowed_to_plant = false
		var main = get_tree().get_root().get_node("Main")
		if main.current_plot == self:
			main.current_plot = null
