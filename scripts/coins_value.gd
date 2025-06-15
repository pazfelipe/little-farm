extends Label

func _process(delta: float) -> void:
	text = str("Moedas: ", Char.coins)
