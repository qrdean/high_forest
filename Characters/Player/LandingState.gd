extends State

class_name LandingState

@export var ground_state : State
@export var landing_animation_name : String

func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == landing_animation_name):
		next_state = ground_state
