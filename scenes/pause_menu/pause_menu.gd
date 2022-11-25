extends CanvasLayer

func _process(_delta):
	if Input.is_action_just_released("toggle_pause_menu"):
		get_tree().paused = !get_tree().paused
		visible = !visible
		
		if visible:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			BackgroundMusic.muffle_music()
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			BackgroundMusic.unmuffle_music()
