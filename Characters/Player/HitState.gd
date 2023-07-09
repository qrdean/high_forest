extends State

class_name PlayerHitState

@export var damageable : Damageable
@export var walk_state: State
@export var dead_state: State
@export var dead_animation_node : String = "dead"
@export var knockback_speed : float = 100.0

@onready var timer : Timer = $Timer

func _ready():
	damageable.connect("on_hit", on_damageable_hit)

func on_enter():
	timer.start()

func on_exit():
	character.velocity = Vector2.ZERO

func on_damageable_hit(_node : Node, _damage_amount : int, knockback_direction : Vector2):
	if(damageable.health > 0):
		character.velocity = knockback_speed * knockback_direction
		emit_signal("interrupt_state", self)
	else:
		emit_signal("interrupt_state", dead_state)
		next_state = dead_state

func _on_timer_timeout():
	next_state = walk_state
