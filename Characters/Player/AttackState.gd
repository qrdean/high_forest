extends State

class_name AttackState

@export var ground_state : State
@export var attack_animation_name : String
@export var attack_animation_2 : String

# need to add a buffer probably
func state_input(event : InputEvent):
	if(event.is_action_pressed("attack")):
		attack()

func attack():
	playback.travel(attack_animation_2)

func animation_is_attack(anim_name):
	return anim_name == attack_animation_name || anim_name == attack_animation_2

func _on_animation_tree_animation_finished(anim_name):
	if(animation_is_attack(anim_name)):
		next_state = ground_state
