extends State

class_name DeadState

@export var dead_animation_node = "dead"
@export var death_sound: AudioStreamPlayer

signal dead()

func on_enter():
	kill_player()

func kill_player():
	death_sound.play()
	playback.travel(dead_animation_node)
	dead.emit()
