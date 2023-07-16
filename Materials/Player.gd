extends CharacterBody2D


var is_right


func _ready():
	$AnimatedSprite2D.play("idle-left")


func _process(delta):
#	if Input.is_action_pressed("ui_left"):
#		print("pressing left")
#		self.velocity = Vector2(-10, 0)
#	if Input.is_action_pressed("ui_right"):
#		self.velocity = Vector2(10, 0)
	velocity = Vector2(
		(Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")) * 10, 
		(Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")) * 10
	)
	move_and_collide(velocity)
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
