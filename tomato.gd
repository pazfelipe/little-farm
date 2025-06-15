extends Area2D

var is_there_a_plant = false
var can_harvest = false
var MIN_TOMATO_CROP_AFTER_HARVEST = 0
var MAX_TOMATO_CROP_AFTER_HARVEST = 2

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	if Input.is_action_just_released("action"):
		if Plot.is_inside:
			if Plot.is_able_to_plant and can_harvest == false:
				plant()
			elif can_harvest:
				harvest()
			else:
				pass
	
	

	
func harvest() -> void:
	if Plot.is_inside and can_harvest:
		Plot.is_able_to_plant = true
		is_there_a_plant = false
		can_harvest = false
		Crops.add_crop("tomato", randi_range(MIN_TOMATO_CROP_AFTER_HARVEST,MAX_TOMATO_CROP_AFTER_HARVEST))
		hide()

func plant() -> void:
	
	if Crops.get_quantity("tomato") == 0:
		return
		
	if Plot.is_able_to_plant and Plot.is_inside and is_there_a_plant == false:
		Crops.remove_crop("tomato", 1)
		Plot.is_able_to_plant = false
		is_there_a_plant = true
		show()
		$AnimatedSprite2D.frame = 0
		await get_tree().create_timer(0.5).timeout
		$AnimatedSprite2D.frame = 1
		await get_tree().create_timer(0.5).timeout
		$AnimatedSprite2D.frame = 2
		await get_tree().create_timer(0.5).timeout
		$AnimatedSprite2D.frame = 3
		await get_tree().create_timer(0.5).timeout
		$AnimatedSprite2D.frame = 4
		await get_tree().create_timer(0.5).timeout
		$AnimatedSprite2D.frame = 5
		can_harvest = true
