extends Area2D

var is_allowed_to_plant: bool = false
var action_pressed = false
var can_harvest = false
var crop_amount = 0
var instance: Node2D

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
	var crop_path = "res://scenes/crops/" + crop + ".tscn"
	var crop_scene = load(crop_path)

	if crop_scene:
		instance = crop_scene.instantiate()
		instance.position = Vector2(111.5, 96.5)
		add_child(instance)
		is_allowed_to_plant = false
		instance.crop_fully_grown.connect(_on_crop_ready)
	else:
		print("Erro: cena não encontrada em ", crop_path)
		
func harvest() -> void:
	if instance:
		instance.queue_free()
		instance = null

	can_harvest = false
	is_allowed_to_plant = true
		
func _on_crop_ready(value: int) -> void:
	crop_amount = value
	can_harvest = true
