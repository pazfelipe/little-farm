extends Area2D

func _ready() -> void:
	print(position, " instance plot position")

func _on_body_entered(body: Node2D) -> void:
	Plot.is_allowed_to_plant = true


func _on_body_exited(body: Node2D) -> void:
	Plot.is_allowed_to_plant = false
