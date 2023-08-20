extends Node


const Game = preload("res://game.tscn")
var game


func _ready():
	game = $Game


func restart():
	$RestartTimer.start()


func _on_restart_timer_timeout():
	game.queue_free()
	game = Game.instantiate()
	add_child(game)
