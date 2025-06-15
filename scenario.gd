extends TileMapLayer

func _ready():
	var butterfly = get_parent().get_node_or_null("butterfly/AnimationPlayer")
	if butterfly:
		butterfly.play("flying")
