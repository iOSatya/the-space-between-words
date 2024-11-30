extends Control

func _on_NewGameButton_pressed():
	# Load the first level of your game
	get_tree().change_scene("res://Scenes/StoryScene.tscn")

func _on_ContinueButton_pressed():
	# Load saved game data (you'll need a save system for this)
	print("Continue button pressed!")  # Replace with actual loading logic

func _on_QuitButton_pressed():
	# Quit the game
	get_tree().quit()
