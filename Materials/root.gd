extends Node


const Game = preload("res://game.tscn")


func restart():
	$RestartTimer.start()


func _on_restart_timer_timeout():
	$Game.queue_free()
	var game = Game.instantiate()
	add_child(game)
