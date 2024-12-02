extends CharacterBody2D

@export var speed = 300
@export var gravity = 30
@export var jump_force = 600

@onready var ap = $AnimationPlayer
@onready var sprite = $Idle



func _physics_process(delta):
	if !is_on_floor():
		velocity.y += gravity
		if velocity.y > 1000:
			velocity.y = 1000
			
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = -jump_force
	
	var horizontal_direction = Input.get_axis("ui_left", "ui_right")
	velocity.x = speed * horizontal_direction
	
	if horizontal_direction != 0:
		sprite.flip_h = (horizontal_direction == -1)

	# Menjalankan pergerakan
	move_and_slide()
	
	update_animations(horizontal_direction)

func update_animations(horizontal_direction):
	if is_on_floor():
		if horizontal_direction == 0:
			ap.play("idle")
		else:
			ap.play("run")
	else:
		if velocity.y < 0:
			ap.play("jump")
