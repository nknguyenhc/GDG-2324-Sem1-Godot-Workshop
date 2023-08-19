extends Node2D


const BackgroundImage = preload("res://map/background-image.tscn")

var curr_image
var width


func _ready():
	curr_image = $BackgroundImage
	width = curr_image.get_node("Sprite2D").texture.get_width() * curr_image.get_node("Sprite2D").scale.x - 2


func _process(delta):
	if curr_image.position.x > 0 && curr_image.position.x < 10:
		var next_image = BackgroundImage.instantiate()
		next_image.position.x = curr_image.position.x - width
		add_child(next_image)
		curr_image = next_image
