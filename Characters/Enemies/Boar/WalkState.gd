extends State


@export var walk_animation_node = "walk"
@export var run_animation_node = "run"
@export var idle_state: State
@export var run_state: State
@onready var timer: Timer = $Timer

var can_attack: bool = true

func on_enter():
	playback.travel(walk_animation_node)
	timer.start()

func attack():
	next_state = run_state

func on_exit():
	timer.stop()

func _on_player_detection_body_entered(body):
	if body is Player:
		attack()

func _on_timer_timeout():
	next_state = idle_state
