extends CharacterBody2D

@export var speed : float = 30.0
@export var hit_state : State

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite : Sprite2D = $Sprite2D

@onready var character_state_machine : CharacterStateMachine = $CharacterStateMachine
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# TODO: could make this an array of positions to iterate over
@export var movement_target_position_1: Vector2 = Vector2(150.0, 0.0)
@export var movement_target_position_2: Vector2 = Vector2(150.0, 0.0)
var going_position_1: bool = true

func _ready():
	animation_tree.active = true

	call_deferred("actor_setup")

func actor_setup():
	await get_tree().physics_frame

	set_movement_target(movement_target_position_1)

func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	if navigation_agent.is_navigation_finished():
		if going_position_1:
			set_movement_target(movement_target_position_2)
			going_position_1 = false
		else:
			set_movement_target(movement_target_position_1)
			going_position_1 = true
		return	

	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()

	var direction: Vector2 = next_path_position - current_agent_position
	direction = direction.normalized()
	direction = direction * speed

	if character_state_machine.check_if_can_move():
		velocity = direction

	move_and_slide()
	update_facing_direction(direction)

func update_facing_direction(direction : Vector2):
	if direction.x > 0:
		sprite.flip_h = true
	elif direction.x < 0:
		sprite.flip_h = false
