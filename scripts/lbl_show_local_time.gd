extends Label

func _process(delta: float) -> void:
	var local_time = Time.get_datetime_dict_from_system()
	var hour = "%02d"%local_time.hour
	var minute = "%02d"%local_time.minute
	var second = "%02d"%local_time.second
	text = hour + ":" + minute + ":" + second
