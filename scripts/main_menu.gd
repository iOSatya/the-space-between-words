extends Control

func _on_new_game_pressed() -> void:
	#get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	GameManager.change_scene_and_save("res://scenes/level_1.tscn")
	
func _on_load_game_pressed() -> void:
	GameManager.load_last_scene()

func _on_quit_pressed() -> void:
	get_tree().quit()
