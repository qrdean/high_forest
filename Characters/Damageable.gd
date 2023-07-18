extends Node

class_name Damageable

signal on_hit(node : Node, damage_taken: int, knockback_direction : Vector2)

@export var health : float = 20
@export var dead_animation_name : String = "dead"
@export var hit_sound: AudioStreamPlayer

func hit(damage, knockback_direction : Vector2):
	health -= damage
	hit_sound.play()
	emit_signal("on_hit", get_parent(), damage, knockback_direction)
	
func _on_animation_tree_animation_finished(anim_name):
	if(anim_name == dead_animation_name):
		get_parent().queue_free()

