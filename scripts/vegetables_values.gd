extends Label

func _process(delta: float) -> void:
	text = str("Tomate: ", Crops.get_items_to_sell("tomato"), "\nMilho: ", Crops.get_items_to_sell("corn"))
