extends Node

var crops = {"tomato": 1, "corn": 1}
var vegetables_to_sell = {
	"tomato": {
		"quantity": 0,
		"price": 0
	},
	"corn": {
		"quantity": 0,
		"price": 0
	}
}

func add_quantity(vegetable_name: String, quantity: int) -> void:
	crops[vegetable_name] += quantity

func reduce_quantity(vegetable_name: String, quantity: int) -> void:
	crops[vegetable_name] -= quantity

func get_quantity(vegetable_name) -> int:
	return crops[vegetable_name]

func add_item_to_sell(item: String, quantity: int, price: int) -> void:
	vegetables_to_sell[item]["quantity"] += quantity
	vegetables_to_sell[item]["price"] = price
	
func get_items_to_sell(vegetable: String) -> int:
	return vegetables_to_sell[vegetable]["quantity"]
