extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("title_screen"):
		get_tree().change_scene_to_file("res://Assets/Scenes/title_screen.tscn")
	if event.is_action_pressed("level_one"):
		get_tree().change_scene_to_file("res://Assets/Scenes/gameplay.tscn")
	if event.is_action_pressed("level_two"):
		pass
	if event.is_action_pressed("level_three"):
		pass
	if event.is_action_pressed("level_four"):
		pass
