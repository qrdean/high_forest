extends Area2D

@export var boar : Boar
@onready var facing_collision_shape_2d : FacingCollisionShape2D = $FacingCollisionShape2D

func _ready():
	monitoring = true
	boar.connect("facing_direction_changed", _on_player_facing_direction_changed)

func _on_player_facing_direction_changed(facing_right: bool):
	if(facing_right):
		facing_collision_shape_2d.position = facing_collision_shape_2d.facing_right_position
	else:
		facing_collision_shape_2d.position = facing_collision_shape_2d.facing_left_position
