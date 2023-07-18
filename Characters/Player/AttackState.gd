extends State

class_name AttackState

@export var ground_state : State
@export var attack_animation_name : String
@export var attack_animation_2 : String
@export var audio_stream_player: AudioStreamPlayer

var can_play = true

# need to add a buffer probably
func state_input(event : InputEvent):
	if(event.is_action_pressed("attack")):
		attack()

func on_enter():
	audio_stream_player.play()

func attack():
	playback.travel(attack_animation_2)
	if can_play:
		audio_stream_player.play()
		can_play = false

func animation_is_attack(anim_name):
	return anim_name == attack_animation_name || anim_name == attack_animation_2

func _on_animation_tree_animation_finished(anim_name):
	if(animation_is_attack(anim_name)):
		can_play = true
		next_state = ground_state
