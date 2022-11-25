extends CanvasLayer

func update_score_label(value: String):
	$ScoreLabel.text = value

func set_heart_count(count: int):
	if count == 1:
		$HeartContainer/HeartTwo.visible = false
		$HeartContainer/HeartThree.visible = false
	elif count == 2:
		$HeartContainer/HeartThree.visible = false
