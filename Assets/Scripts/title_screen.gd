extends Node2D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("start_game"):
		get_tree().change_scene_to_file("res://Assets/Scenes/gameplay.tscn")
	if event.is_action_pressed("level_select"):
		get_tree().change_scene_to_file("res://Assets/Scenes/level_select_screen.tscn")
	if event.is_action_pressed("quit_game"):
		get_tree().quit()
