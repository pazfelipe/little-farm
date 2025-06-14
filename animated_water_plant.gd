extends AnimatedSprite2D

@export var animated_frame: String = "plant_right"
@export var delay: float = 0

func _ready() -> void:
	await get_tree().create_timer(delay).timeout
	play(animated_frame)
