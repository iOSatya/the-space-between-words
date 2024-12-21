extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(body: Node2D) -> void:
	timer.start()
	
func _on_timer_timeout() -> void:
	GameManager.change_scene_and_save("res://scenes/end.tscn")
