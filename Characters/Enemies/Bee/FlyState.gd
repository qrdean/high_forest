extends State

@export var attack_state: State

@onready var timer: Timer = $Attack_Timer

var can_attack: bool = true

func attack():
	next_state = attack_state

func _on_player_detection_body_entered(body):
	if body is Player:
		if can_attack:
			timer.start()
			attack()
			can_attack = false

func _on_timer_timeout():
	can_attack = true
