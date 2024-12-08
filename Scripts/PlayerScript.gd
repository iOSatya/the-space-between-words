extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const GRAVITY = 1000
const SPEED = 300
const JUMP = -400

enum State { Idle, Run, Fall, Jump }

var current_state

func _ready():
	current_state = State.Idle
	
func _physics_process(delta):
	player_falling(delta)
	player_idle(delta)
	player_run(delta)
	player_jump(delta)
	
	move_and_slide()
	player_animation()

func player_falling(delta):
	if !is_on_floor():
		velocity.y += GRAVITY * delta
		if velocity.y >= 0:
			current_state = State.Fall


func player_jump(delta):
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP
		current_state = State.Jump

func player_idle(delta):
	if is_on_floor():
		current_state = State.Idle

func player_run(delta):
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction != 0:
		if is_on_floor():
			current_state = State.Run
		if direction < 0:
			animated_sprite_2d.flip_h = true
		else:
			animated_sprite_2d.flip_h = false

func player_animation():
	if current_state == State.Idle:
		animated_sprite_2d.play("Idle")
	elif current_state == State.Run:
		animated_sprite_2d.play("Run")
	elif current_state == State.Jump and animated_sprite_2d.animation != "Jump":
		animated_sprite_2d.play("Jump")
	elif current_state == State.Fall and animated_sprite_2d.animation != "Fall":
		animated_sprite_2d.play("Fall")
