extends Node

class_name BaseLevel

# Member variables
var is_ball_in_play: bool = false

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	
	GameManager.connect("game_win", self, "_on_GameManager_game_win")

	$Ball.connect("destroyed_brick", self, "_on_Ball_destroyed_brick")
	$Ball.connect("destroyed_power_up", self, "_on_Ball_destroyed_power_up")
	$Ball.connect("hit_bottom_border", self, "_on_Ball_hit_bottom_border")
	
	$HUD.update_score_label(String(GameManager.score))
	$HUD.set_heart_count(GameManager.health)

func _process(_delta):
	if !is_ball_in_play && Input.is_action_just_released("ui_accept"):
		is_ball_in_play = true
		$Ball.random_direction_pulse()

func _on_GameManager_game_win():
	get_tree().paused = true
	$HUD.visible = false
	$GameEnd.present(true, GameManager.score)

func _on_Ball_destroyed_brick():
	GameManager.score += 10
	$HUD.update_score_label(String(GameManager.score))
	
	# 1 instead of 0 because the final brick may not have been destroyed yet
	# since we don't wait for queue_free to actually free the node
	if $BrickLayout.get_child_count() <= 1:
		GameManager.on_level_complete()

func _on_Ball_destroyed_power_up():
	$Player.handle_paddle_power_up()

func _on_Ball_hit_bottom_border():
	GameManager.health -= 1

	if GameManager.health != 0:
		$HUD.set_heart_count(GameManager.health)
		$Ball.reset_position_and_velocity(Vector2(512, 448))
		is_ball_in_play = false
	else:
		get_tree().paused = true
		$HUD.visible = false
		$GameEnd.present(false, GameManager.score)
