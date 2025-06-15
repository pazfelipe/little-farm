extends Node

var crops = {"tomato": 1, "corn": 1}

func add_quantity(vegetable_name: String, quantity: int) -> void:
	crops[vegetable_name] += quantity

func reduce_quantity(vegetable_name: String, quantity: int) -> void:
	crops[vegetable_name] -= quantity

func get_quantity(vegetable_name) -> int:
	return crops[vegetable_name]
