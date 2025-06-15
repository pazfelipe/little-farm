extends Area2D

var is_able_to_plant = true
var is_inside = false
var is_there_a_plant = false
var can_harvest = false
var MIN_TOMATO_CROP_AFTER_HARVEST = 1
var MAX_TOMATO_CROP_AFTER_HARVEST = 4

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	if Input.is_action_just_released("action"):
		if is_inside:
			if is_able_to_plant:
				plant()
			elif can_harvest:
				harvest()
			else:
				pass
	
	

func _on_body_entered(body: Node2D) -> void:
	is_inside = true

func _on_body_exited(body: Node2D) -> void:
	is_inside = false
	is_able_to_plant = false
	
func harvest() -> void:
	if is_inside and can_harvest:
		is_able_to_plant = true
		is_there_a_plant = false
		can_harvest = false
		Globals.tomato_crops += randi_range(MIN_TOMATO_CROP_AFTER_HARVEST,MAX_TOMATO_CROP_AFTER_HARVEST)
		hide()

func plant() -> void:
	
	if Globals.tomato_crops == 0:
		return
	
	if is_able_to_plant and is_inside and is_there_a_plant == false:
		Globals.tomato_crops -= 1
		is_able_to_plant = false
		is_there_a_plant = true
		show()
		$AnimatedSprite2D.frame = 0
		await get_tree().create_timer(1).timeout
		$AnimatedSprite2D.frame = 1
		await get_tree().create_timer(1).timeout
		$AnimatedSprite2D.frame = 2
		await get_tree().create_timer(1).timeout
		$AnimatedSprite2D.frame = 3
		await get_tree().create_timer(1).timeout
		$AnimatedSprite2D.frame = 4
		await get_tree().create_timer(1).timeout
		$AnimatedSprite2D.frame = 5
		can_harvest = true
