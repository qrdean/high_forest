extends State

@export var idle_state: State
@export var run_animation_name : String
@export var player_detection: Area2D

@onready var timer: Timer = $Timer

func on_enter():
	playback.travel(run_animation_name)
	timer.start()
	
func _on_timer_timeout():
	next_state = idle_state
