extends CharacterBody2D

var SPEED = 100

func _ready():
	$AnimatedSprite2D.play("idle")
	
	var butterfly = get_parent().get_node_or_null("butterfly/AnimationPlayer")
	if butterfly:
		butterfly.play("get_day")
		

func _process(delta: float) -> void:
	Char.update_position(position)
	
func _physics_process(delta: float) -> void:
	
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
#	if enabled it disables the diagonal motion
	#if Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down"):
		#direction.x = 0
	
	if direction:
		velocity = direction * SPEED
		
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")
	
	move_and_slide()
	
	if Input.is_action_just_pressed("ui_left"):
		$AnimatedSprite2D.play("moving_backward")
		
	if Input.is_action_just_pressed("ui_right"):
		$AnimatedSprite2D.play("moving_forward")
		
	if Input.is_action_just_pressed("ui_up"):
		$AnimatedSprite2D.play("moving_up")


func _on_bucket_crops_body_entered(body: Node2D) -> void:
	Crops.add_quantity("tomato", 1)
	Crops.add_quantity("corn", 1)


func _on_door_house_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file.bind("res://scenes/inside_house.tscn").call_deferred() 


func _on_door_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file.bind("res://main.tscn").call_deferred() 


func _on_bed_body_entered(body: Node2D) -> void:
	Globals.bed_dialog = "Acho que vou dormir ...."


func _on_bed_body_exited(body: Node2D) -> void:
	Globals.bed_dialog = ""
