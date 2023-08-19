extends Node2D


const SPEED = 2


func _process(delta):
	position.x += SPEED


func _on_existence_timer_timeout():
	queue_free()
