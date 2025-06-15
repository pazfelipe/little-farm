extends Area2D

signal crop_fully_grown(value: int)

func _ready() -> void:
	await get_tree().process_frame
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
	
	emit_signal("crop_fully_grown", {"coin": 3, "harvested_crops": randi_range(0,3)})
