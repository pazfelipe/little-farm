extends Label

func _process(delta: float) -> void:
	text = str("Tomate: ", Crops.get_quantity("tomato"), "\nMilho: ", Crops.get_quantity("corn"))
