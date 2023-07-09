extends State

class_name DeadState

@export var dead_animation_node = "dead"

func on_enter():
	kill_player()
	pass

func kill_player():
	playback.travel(dead_animation_node)
	print("Trigger Game Over")
