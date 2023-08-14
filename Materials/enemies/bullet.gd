extends Area2D


const DAMAGE = 10


func _ready():
	$AnimatedSprite2D.play("default")
	print(position)


func _process(delta):
	position += Vector2(-10, 0)


func _on_body_entered(body):
	body.take_damage(DAMAGE)
