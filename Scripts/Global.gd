extends Node

var save_file_path = "user://save_data.json"

func save_game(scene_path):
	var save_data = {
		"current_scene": scene_path
		# Add other game state data here, e.g., player position, health, etc.
	}
	
	var file = FileAccess.open(save_file_path, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data))
		file.close()
		print("Game saved to:", save_file_path)
	else:
		var error = FileAccess.get_open_error()
		print("Failed to save game. Error code:", error)

func load_game():
	if FileAccess.file_exists(save_file_path):
		var file = FileAccess.open(save_file_path, FileAccess.READ)
		if file:
			var json_string = file.get_as_text()
			file.close()
			
			var json = JSON.new()
			var parse_result = json.parse(json_string)
			
			if parse_result == OK:
				return json.get_data()
			else:
				print("JSON Parse Error: ", json.get_error_message(), " at line ", json.get_error_line())
		else:
			var error = FileAccess.get_open_error()
			print("Failed to read save file. Error code:", error)
	
	return null

func change_scene_with_save(scene_path):
	save_game(scene_path)  # Save the game before changing the scene
	get_tree().change_scene_to_file(scene_path)  # Note: method name changed in Godot 4.x
