extends CanvasLayer

func _ready():
	visible = false
	get_tree().paused = false
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		if get_tree().paused:
			visible = false
			get_tree().paused = false
		else:
			visible = true
			get_tree().paused = true
	if event.is_action_pressed("reset_level"):
		if get_tree().paused:
			GameManager.to_area(GameManager.current_level)
			visible = false
			get_tree().paused = false
	if event.is_action_pressed("quit_game"):
		if get_tree().paused:
			get_tree().quit()
