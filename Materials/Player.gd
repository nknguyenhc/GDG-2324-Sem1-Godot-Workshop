extends CharacterBody2D


var is_right
const acceleration = 80

var health = 100


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
		velocity.y = -1300
	
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
	
	if health < 0:
		die()


func take_damage(damage):
	health -= damage
	print("take damage")


func die():
	queue_free()
