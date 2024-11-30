extends Node

@export var animation_player : AnimationPlayer
@export var autoplay : bool = false

func _input(event):
	if event.is_action_pressed("next") and not animation_player.is_playing():
		animation_player.play()

func pause():
	if autoplay == false:
		animation_player.pause()
