extends Node

@onready var shh = $Shh

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Levels/test_level.tscn")

func _on_shut_up_pressed():
	shh.play()

func _on_quit_pressed():
	get_tree().quit()	
