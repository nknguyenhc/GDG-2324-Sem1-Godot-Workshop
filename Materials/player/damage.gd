extends Area2D


const DAMAGE = 10


func _ready():
	$AnimatedSprite2D.play("default")


func _on_body_entered(body):
	body.take_damage(DAMAGE)
