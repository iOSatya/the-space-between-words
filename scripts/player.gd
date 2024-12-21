extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

enum AnimationState {
	IDLE,
	RUN,
	JUMP,
	FALL
}

var current_state = AnimationState.IDLE

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	update_animation(velocity)
	
func update_animation(velocity):
	var new_state = AnimationState.IDLE
	
	if velocity.x > 0:
		new_state = AnimationState.RUN
		animated_sprite_2d.flip_h = false
	elif velocity.x < 0:
		new_state = AnimationState.RUN
		animated_sprite_2d.flip_h = true
		
	if velocity.y < 0:
		new_state = AnimationState.JUMP
	elif velocity.y >= 0 and !is_on_floor():
		new_state = AnimationState.FALL
	
	if new_state != current_state:
		current_state = new_state
		play_animation()
	
func play_animation():
	if current_state == AnimationState.IDLE:
		animated_sprite_2d.play("Idle")
	elif current_state == AnimationState.RUN:
		animated_sprite_2d.play("Run")
	elif current_state == AnimationState.JUMP:
		animated_sprite_2d.play("Jump")
	elif current_state == AnimationState.FALL:
		animated_sprite_2d.play("Fall")
