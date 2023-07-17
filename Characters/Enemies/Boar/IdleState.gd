extends State

class_name BoarIdleState

@export var idle_animation_node = "idle"
@export var run_animation_node = "run"
@export var walk_state: State
@export var run_state: State
@onready var timer: Timer = $Timer

var can_charge: bool = true

func _ready():
	print_debug("BoarIdleState ready")
	timer.start()

func on_enter():
	print_debug("stuff")
	playback.travel(idle_animation_node)
	timer.start()

func on_exit():
	timer.stop()

func attack():
	next_state = run_state

func _on_player_detection_body_entered(body):
	print_debug("playerdetected:", body.name)
	if body is Player:
		print_debug("playerdetected:", body.name)
		attack()

func _on_timer_timeout():
	print_debug("Timer timeout")
	next_state = walk_state
