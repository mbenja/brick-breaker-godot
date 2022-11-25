extends KinematicBody2D

# Member variables
var movement_speed = 400

func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	elif Input.is_action_pressed("move_right"):
		velocity.x += 1
	
	if velocity.length() > 0:
		velocity = velocity.normalized() * movement_speed
		
	move_and_collide(velocity * delta)

func _on_PowerUpCountdownTimer_timeout():
	$AnimationPlayer.play("scale_down")

func handle_paddle_power_up():
	$AnimationPlayer.play("scale_up")
	$PowerUpCountdownTimer.start()

func set_scale_x(value: int):
	scale.x = value
