extends CharacterBody2D
@export var patrol_points : Node

const GRAVITY = 1000
const SPEED = 1500

enum State { Idle, Walk }

var current_state : State
var direction : Vector2 = Vector2.LEFT
var number_of_points : int
var point_positions : Array[Vector2]
var current_point : Vector2
var current_point_position : int

func _ready():
	if patrol_points != null:
		number_of_points = patrol_points.get_children().size()
		for point in patrol_points.get_children():
			point_positions.append(point.global_position)
		current_point = point_positions[current_point_position]
		current_state = State.Idle
	else:
		print("No Patrol Points")
func _physics_process(delta: float):
	enemy_falling(delta)
	enemy_idle(delta)
	enemy_walk(delta)
	
	move_and_slide()
	
func enemy_falling(delta):
	velocity.y += GRAVITY * delta

func enemy_idle(delta):
	velocity.x = move_toward(velocity.x, 0, SPEED)
	current_state = State.Idle

func enemy_walk(delta):
	velocity.x = direction.x * SPEED * delta
	current_state = State.Walk
