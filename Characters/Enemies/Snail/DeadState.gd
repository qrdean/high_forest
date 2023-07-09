extends State

@export var dead_animation_node : String = "dead"

func on_enter():
	playback.travel(dead_animation_node)

