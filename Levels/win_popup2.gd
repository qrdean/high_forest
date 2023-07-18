extends CanvasLayer

@export var file_path: String
@onready var win_sound: AudioStreamPlayer = $WinSound

func pause():
	get_tree().paused = not get_tree().paused
	visible = get_tree().paused

func _on_resume_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Levels/test_level_2.tscn")

func _on_ui_win():
	win_sound.play()
	pause()
