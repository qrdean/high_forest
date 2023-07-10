extends State

@export var dead_animation_node = "dead"
@export var PICKUP_SCENE: PackedScene

func on_enter():
	kill_enemy()

func kill_enemy():
	playback.travel(dead_animation_node)
	var pickup = PICKUP_SCENE.instantiate()
	pickup.global_position = character.global_position
	character.get_parent().call_deferred("add_child", pickup)
