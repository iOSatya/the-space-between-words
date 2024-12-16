extends StaticBody2D

@onready var interaction_area = $InteractionArea


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	interaction_area.interact = Callable(self, "_talk")


func _talk():
	sprite.frame = 1 if sprite.frame == 0 else 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
