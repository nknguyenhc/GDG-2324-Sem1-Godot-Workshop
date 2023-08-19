extends Area2D


const DAMAGE = 10


func _ready():
	$AnimatedSprite2D.play("default")


func _process(delta):
	position += Vector2(-10, 0)


func _on_body_entered(body):
	body.take_damage(DAMAGE)


func _on_existence_timer_timeout():
	queue_free()
