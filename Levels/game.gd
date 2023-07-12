extends Node2D
class_name Game

@export var player: Player
@export var ui: CanvasLayer

@export var snail: PackedScene
@export var bee: PackedScene

@onready var nav_region: NavigationRegion2D = $NavigationRegion2D

func _ready():
	if !player.collected.is_connected(ui._on_collected):
		player.collected.connect(ui._on_collected)
	
	if !player.damaged.is_connected(ui._on_damage):
		player.damaged.connect(ui._on_damage)
	
	for i in range(0, 125):
		_spawn_snail()
		_spawn_bee()

func _spawn_bee():
	var newBee = bee.instantiate() as Bee
	var range_x = randf_range(0, nav_region.get_viewport().size.x)
	# var range_y = randf_range(0, nav_region.get_viewport().size.y)
	newBee.position = Vector2(range_x, 160)

	newBee.movement_target_position_1 = Vector2(20.0, 180.0)
	newBee.movement_target_position_2 = Vector2(450.0, 180.0)

	add_child(newBee)


func _spawn_snail():
	var newSnail = snail.instantiate() as Snail
	var range_x = randf_range(0, nav_region.get_viewport().size.x)
	newSnail.position = Vector2(range_x, 160)

	newSnail.movement_target_position_1 = Vector2(20.0, 180.0)
	newSnail.movement_target_position_2 = Vector2(450.0, 180.0)

	add_child(newSnail)
