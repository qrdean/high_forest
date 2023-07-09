extends State

@export var move_state: State
@export var attack_animation_name : String

func on_enter():
	playback.travel(attack_animation_name)

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == attack_animation_name):
		next_state = move_state


