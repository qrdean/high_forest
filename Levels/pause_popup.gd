extends CanvasLayer

func _process(_delta):
	if Input.is_action_just_pressed("ui_pause"):
		pause()

func pause():
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused

func _on_resume_pressed():
	pause()

func _on_quit_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Levels/main_menu.tscn")
