extends ProgressBar


func _process(delta):
	value = get_parent().get_node("Gun").health
