extends Label

func _process(delta: float) -> void:
	text = str(Crops.get_quantity("tomato"))
