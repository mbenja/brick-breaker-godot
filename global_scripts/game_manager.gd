extends Node

# Custom signals
signal game_win

# Member variables
var score: int = 0
var health: int = 3
var current_level: int = 1
var max_level: int = 3
var audio_player = AudioStreamPlayer.new()
var audio_stream = load("res://assets/audio/level_complete.wav")

func _ready():
	audio_player.stream = audio_stream
	add_child(audio_player)

func reset_game_variables():
	score = 0
	health = 3
	current_level = 1
	
func on_level_complete():
	if current_level == max_level:
		emit_signal("game_win")
	else:
		current_level += 1
		audio_player.play()
		match current_level:
			2:
				SceneChanger.change_scene("res://scenes/levels/level_two/level_two.tscn")
			3:
				SceneChanger.change_scene("res://scenes/levels/level_three/level_three.tscn")
