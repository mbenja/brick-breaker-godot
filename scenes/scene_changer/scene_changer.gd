extends CanvasLayer

# Member variables
var next_scene: String = ""

func _ready():
	visible = false

func change_scene(scene: String):
	visible = true
	$AnimationPlayer.play("fade_out")
	next_scene = scene

func on_fade_out_anim_complete():
	get_tree().change_scene(next_scene)
	$AnimationPlayer.play("fade_in")

func on_fade_in_anim_complete():
	visible = false
