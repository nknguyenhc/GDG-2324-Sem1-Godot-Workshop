extends Area2D


const DAMAGE = 20
var target = null
var is_damaging = false


func _ready():
	$AnimationPlayer.play("fire")


func _on_body_entered(body):
	target = body
	if is_damaging:
		target.take_damage(DAMAGE)


func _on_body_exited(body):
	if body == target:
		target = null


func _on_damage_timer_timeout():
	is_damaging = true
	if target != null:
		target.take_damage(DAMAGE)


func _on_animation_player_animation_finished(anim_name):
	queue_free()
