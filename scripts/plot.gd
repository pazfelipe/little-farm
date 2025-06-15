extends Area2D

var is_allowed_to_plant: bool = false
var action_pressed = false
var can_harvest = false
var instance: Node2D
var crops_to_be_collected = 0
var collected_coins = 0

@export var crop: String = ""

	
func _on_body_entered(body: Node2D) -> void:
	if body.name == "farmer":
		is_allowed_to_plant = true
		get_tree().get_root().get_node("Main").current_plot = self

func _on_body_exited(body: Node2D) -> void:
	if body.name == "farmer":
		is_allowed_to_plant = false
		action_pressed = false
		if get_tree().get_root().get_node("Main").current_plot == self:
			get_tree().get_root().get_node("Main").current_plot = null
			
func try_plant():
	if is_allowed_to_plant and not instance:
		plant()

func try_harvest():
	if can_harvest and instance:
		harvest()

func plant() -> void:
	
	if Crops.get_quantity(crop) == 0:
		return
	
	var crop_path = "res://scenes/crops/" + crop + ".tscn"
	var crop_scene = load(crop_path)

	if crop_scene:
		instance = crop_scene.instantiate()
		instance.position = Vector2(111.5, 96.5)
		add_child(instance)
		is_allowed_to_plant = false
		Crops.reduce_quantity(crop, 1)
		instance.crop_fully_grown.connect(_on_crop_ready)
	else:
		print("Erro: cena não encontrada em ", crop_path)
		
func harvest() -> void:
	if instance:
		instance.queue_free()
		instance = null

	can_harvest = false
	is_allowed_to_plant = true
	Crops.add_quantity(crop, crops_to_be_collected)
	Crops.add_item_to_sell(crop, 1, collected_coins)
		
func _on_crop_ready(harvest: Dictionary) -> void:
	crops_to_be_collected = harvest.get("harvested_crops", 0)
	collected_coins = harvest.get("coins", 0)
	can_harvest = true
