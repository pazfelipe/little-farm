extends Area2D

var is_able_to_plant = false
var is_inside = false
var is_there_a_plant = false
var can_harvest = false

func _ready() -> void:
	hide()

func _process(delta: float) -> void:
	if Input.is_action_just_released("action"):
		if is_inside:
			is_able_to_plant = true
	
	plant()
	

func _on_body_entered(body: Node2D) -> void:
	is_inside = true
	var butterfly = get_parent().get_node_or_null("butterfly/AnimationPlayer")
	if butterfly:
		butterfly.play("flying")
		var darker_box = get_parent().get_node_or_null("butterfly/ColorRect")
		if darker_box:
			darker_box.hide()

func _on_body_exited(body: Node2D) -> void:
	is_inside = false
	is_able_to_plant = false
	
func harvest() -> void:
	pass

func plant() -> void:
	if Globals.tomato_crops == 0:
		return
	
	if is_able_to_plant and is_inside and not is_there_a_plant:
		Globals.tomato_crops -= 1
		is_able_to_plant = false
		is_there_a_plant = true
		show()
		$AnimatedSprite2D.frame = 0
		await get_tree().create_timer(3.0).timeout
		$AnimatedSprite2D.frame = 1
		await get_tree().create_timer(4.0).timeout
		$AnimatedSprite2D.frame = 2
		await get_tree().create_timer(5.0).timeout
		$AnimatedSprite2D.frame = 3
		await get_tree().create_timer(6.0).timeout
		$AnimatedSprite2D.frame = 4
		await get_tree().create_timer(7.0).timeout
		$AnimatedSprite2D.frame = 5
		can_harvest = true
