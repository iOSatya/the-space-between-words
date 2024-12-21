extends Control

#func _on_new_game_button_pressed():
	## Replace with your game scene path
	#get_tree().change_scene_to_file("res://scenes/level_1.tscn")
#
#func _on_load_game_button_pressed():
	## Implement your save game loading logic here
	#pass
#
#func _on_quit_button_pressed():
	#get_tree().quit()


func _on_new_game_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_1.tscn")
	
func _on_load_game_pressed() -> void:
	pass # Replace with function body.

func _on_quit_pressed() -> void:
	get_tree().quit()
