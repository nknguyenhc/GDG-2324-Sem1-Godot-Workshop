extends CharacterBody2D


const Bullet = preload("res://enemies/bullet.tscn")
const Fire = preload("res://enemies/fire.tscn")

const speed = 8
var is_up = true

var health = 100

var player


func take_damage(damage):
	health -= damage


func _ready():
	player = get_parent().get_node("Player")


func _process(delta):
	position += Vector2(0, (-1 if is_up else 1) * speed)


func _on_bullet_timer_timeout():
	var bullet = Bullet.instantiate()
	bullet.position = position
	get_parent().add_child(bullet)


func _on_movement_timer_timeout():
	is_up = !is_up


func _on_fire_timer_timeout():
	if weakref(player).get_ref():
		var fire = Fire.instantiate()
		fire.position = player.position
		get_parent().add_child(fire)
