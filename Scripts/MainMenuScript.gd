extends Control

func _on_NewGameButton_pressed():
	# Load the first level of your game
	Global.change_scene_with_save("res://Scenes/Levels/TestLevelScene.tscn")

func _on_ContinueButton_pressed():
	# Load saved game data (you'll need a save system for this)
	var save_data = Global.load_game()
	if save_data and "current_scene" in save_data:
		get_tree().change_scene_to_file(save_data["current_scene"])
	else:
		print("No save data found!")
	print("Continue button pressed!")  # Replace with actual loading logic

func _on_QuitButton_pressed():
	# Quit the game
	get_tree().quit()
