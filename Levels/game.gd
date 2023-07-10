extends Node2D
class_name Game

@export var player: Player
@export var ui: CanvasLayer

func _ready():
	if !player.collected.is_connected(ui._on_collected):
		player.collected.connect(ui._on_collected)
