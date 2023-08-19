extends ProgressBar


var player


func _ready():
	player = get_parent().get_node("Player")


func _process(delta):
	if weakref(player).get_ref():
		value = player.health
