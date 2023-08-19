extends CharacterBody2D


var is_right
const acceleration = 80

var health = 100

const Attack = preload("res://player/Damage.tscn")
var is_attacking = false
var attack_instance
const attack_offset = 100


func _ready():
	$AnimatedSprite2D.play("idle-left")
	up_direction = Vector2(0, -1)
	floor_max_angle = deg_to_rad(10)


func _process(delta):
#	if Input.is_action_pressed("ui_left"):
#		print("pressing left")
#		self.velocity = Vector2(-10, 0)
#	if Input.is_action_pressed("ui_right"):
#		self.velocity = Vector2(10, 0)
	velocity = Vector2(
		(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * 500, 
#		(Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")) * 10
		velocity.y + acceleration
	)
	
	if Input.is_action_just_pressed("ui_jump") and is_on_floor():
		velocity.y = -1500
	
	move_and_slide()
	if velocity.x > 0:
		$AnimatedSprite2D.play("run-right")
		is_right = true
	elif velocity.x == 0:
		if is_right:
			$AnimatedSprite2D.play("idle-right")
		else:
			$AnimatedSprite2D.play("idle-left")
	else:
		$AnimatedSprite2D.play("run-left")
		is_right = false
	
	if not is_attacking:
		if Input.is_action_just_pressed("attack"):
			attack()
	else:
		attack_instance.position = Vector2(attack_offset if is_right else -attack_offset, 0)
	
	if health < 0:
		die()


func take_damage(damage):
	health -= damage


func attack():
	is_attacking = true
	attack_instance = Attack.instantiate()
	add_child(attack_instance)
	$AttackTimer.start()


func die():
	get_parent().get_parent().restart()
	queue_free()


func _on_attack_timer_timeout():
	attack_instance.queue_free()
	is_attacking = false
