extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("title_screen"):
		get_tree().change_scene_to_file("res://Assets/Scenes/title_screen.tscn")
	if event.is_action_pressed("level_one"):
		Globals.start_level = "tutorial_level"
		get_tree().change_scene_to_file("res://Assets/Scenes/gameplay.tscn")
	if event.is_action_pressed("level_two"):
		Globals.start_level = "level_one"
		get_tree().change_scene_to_file("res://Assets/Scenes/gameplay.tscn")
	if event.is_action_pressed("level_three"):
		Globals.start_level = "level_two"
		get_tree().change_scene_to_file("res://Assets/Scenes/gameplay.tscn")
	if event.is_action_pressed("level_four"):
		Globals.start_level = "level_three"
		get_tree().change_scene_to_file("res://Assets/Scenes/gameplay.tscn")
