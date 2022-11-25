extends KinematicBody2D

# Custom signals
signal destroyed_brick
signal destroyed_power_up
signal hit_bottom_border

# Member variables
var movement_speed = 400
var velocity = Vector2.ZERO

func _ready():
	randomize()

# Called every frame before each physics step
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		handle_collision(collision)

func handle_collision(collision: KinematicCollision2D):
	if collision.collider.is_in_group("Brick"):
		$BrickHitPlayer.play()
		collision.collider.queue_free()
		emit_signal("destroyed_brick")
	elif collision.collider.is_in_group("PowerUp"):
		$PowerUpHitPlayer.play()
		collision.collider.queue_free()
		emit_signal("destroyed_power_up")
	elif collision.collider.is_in_group("BottomBorder"):
		$LoseHeartPlayer.play()
		emit_signal("hit_bottom_border")
	
	velocity = velocity.bounce(collision.normal)

func reset_position_and_velocity(pos: Vector2):
	velocity = Vector2.ZERO
	position = pos

func random_direction_pulse():
	velocity = Vector2(rand_range(-1, 1), -1).normalized() * movement_speed
