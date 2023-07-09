extends CharacterBody2D

class_name Bee

@export var speed : float = 100.0
@export var vertical_speed : float = 100.0
@export var attack_state: State

@onready var animation_tree : AnimationTree = $AnimationTree
@onready var sprite : Sprite2D = $Sprite2D
@onready var character_state_machine : CharacterStateMachine = $CharacterStateMachine

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

# This method is just a placeholder. Could make something more sophisticated
# Like using an array of Vector2's 
@export var movement_target_position_1: Vector2 = Vector2(150.0, 0.0)
@export var movement_target_position_2: Vector2 = Vector2(150.0, 0.0)
var going_position_1: bool = true

signal facing_direction_changed(facing_right: bool)

func _ready():
	animation_tree.active = true 
	call_deferred("actor_setup")

func actor_setup():
	await get_tree().physics_frame

	set_movement_target(movement_target_position_1)

func set_movement_target(movement_target: Vector2):
	navigation_agent.target_position = movement_target

func _physics_process(_delta):
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

	if character_state_machine.current_state == attack_state:
		velocity.x = move_toward(velocity.x, 0, speed)


	move_and_slide()
	update_facing_direction(direction)

func update_facing_direction(direction : Vector2):
	if direction.x > 0:
		sprite.flip_h = true
	elif direction.x < 0:
		sprite.flip_h = false

	emit_signal("facing_direction_changed", !sprite.flip_h)
