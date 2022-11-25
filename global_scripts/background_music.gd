extends Node

var audio_player = AudioStreamPlayer.new()
var audio_stream = load("res://assets/audio/background_music.wav")

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	audio_player.stream = audio_stream
	add_child(audio_player)

func play_music():
	audio_player.play()

func stop_music():
	audio_player.stop()

func muffle_music():
	audio_player.volume_db = -10

func unmuffle_music():
	audio_player.volume_db = 0
