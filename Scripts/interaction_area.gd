extends Area2D
class_name InteractionArea

@export var action_name: String = "interact"

var interact: Callable = func():
	pass 


func _on_area_shape_entered(area_rid: RID, area: Area2D, area_shape_index: int, local_shape_index: int) -> void:
	InteractionManager.register_area(self)


func _on_body_exited(body: Node2D) -> void:
	InteractionManager.unregister_area(self)
