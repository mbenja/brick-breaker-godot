extends Node2D

func _ready():
	BackgroundMusic.play_music()

func _on_PlayButton_pressed():
	GameManager.reset_game_variables()
	SceneChanger.change_scene("res://scenes/levels/level_one/level_one.tscn")
