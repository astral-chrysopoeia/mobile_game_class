extends CanvasLayer

@export var player : PlayerController
@export var gameplay_manager : Node2D

@onready var switch_controls_text: Label = $SwitchControls/SwitchControlsText

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
			gameplay_manager.to_area(gameplay_manager.current_level)
			visible = false
			get_tree().paused = false
	if event.is_action_pressed("quit_game"):
		if get_tree().paused:
			get_tree().quit()
	if event.is_action_pressed("swap_controls"):
		if get_tree().paused:
			player.switch_controls()
			if player.active_controls == player.ControlScheme.JOYSTICK:
				switch_controls_text.text = "Controls:\nJoystick"
			elif player.active_controls == player.ControlScheme.BUTTON:
				switch_controls_text.text = "Controls:\nButtons"
