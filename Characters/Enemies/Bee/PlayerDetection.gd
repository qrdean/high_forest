extends Area2D

@export var attack_state : State
@export var bee : Bee
@export var facing_collision_shape_2d : FacingCollisionShape2D

func _ready():
	monitoring = true
	bee.connect("facing_direction_changed", _on_player_facing_direction_changed)

func _on_player_facing_direction_changed(facing_right: bool):
	if(facing_right):
		facing_collision_shape_2d.position = facing_collision_shape_2d.facing_right_position
	else:
		facing_collision_shape_2d.position = facing_collision_shape_2d.facing_left_position
