extends Label

var is_played = false

func _process(delta: float) -> void:
	text = Globals.bed_dialog
	
	if text:
		if not is_played:
			$AnimationPlayer.play("show")
			is_played = true
	else:
		$AnimationPlayer.stop()
		is_played = false
