extends Area2D

func _ready() -> void:
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
