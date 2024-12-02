extends Node

@export var animation_player : AnimationPlayer
@export var autoplay : bool = false
@export var next_scene : PackedScene

func _input(event):
	if event.is_action_pressed("next") and not animation_player.is_playing():
		animation_player.play()

func pause():
	if autoplay == false:
		animation_player.pause()

func change_scene():
	Global.change_scene_with_save("res://Scenes/game.tscn")
