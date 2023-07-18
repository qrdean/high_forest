extends CanvasLayer

signal restart()

func pause():
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused

func _on_restart_pressed():
	restart.emit()
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Levels/test_level.tscn")

func _on_player_dead():
	visible = true
