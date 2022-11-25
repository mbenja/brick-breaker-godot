extends CanvasLayer

func present(is_win: bool, final_score: int):
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	BackgroundMusic.stop_music()
	
	if is_win:
		$TitleLabel.text = "you win"
		$GameWinAudioPlayer.play()
	else:
		$TitleLabel.text = "game over"
		$GameOverAudioPlayer.play()

	$FinalScoreTextLabel.text = String(final_score)
	
	visible = true

func _on_MainMenuButton_pressed():
	get_tree().paused = false
	SceneChanger.change_scene("res://scenes/main.tscn")
