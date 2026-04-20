extends CharacterBody2D
class_name PlayerController

@export var speed = 10.0
@export var jump_power = 10.0

var speed_multiplier = 30.0
var jump_multiplier = -30.0
var direction = 0

@onready var joystick_controls: VirtualJoystick = $Camera2D/CanvasLayer/JoystickControls
@onready var button_controls: Node2D = $Camera2D/CanvasLayer/ButtonControls
@onready var jump_button: TouchScreenButton = $Camera2D/CanvasLayer/JumpButton
@export var active_controls := ControlScheme.JOYSTICK
enum ControlScheme {
	JOYSTICK, #use joystick controls
	BUTTON    #use button controls
}

func _ready():
	to_spawn()
	match active_controls:
		ControlScheme.JOYSTICK:
			joystick_controls.visible = true
			button_controls.visible = false
			jump_button.scale = Vector2(4,4)
			jump_button.transform.origin = Vector2(1024.0,448.0)
			joystick_controls.active = true
		ControlScheme.BUTTON:
			button_controls.visible = true
			joystick_controls.visible = false
			jump_button.scale = Vector2(3,3)
			jump_button.transform.origin = Vector2(144.0,368.0)
			joystick_controls.active = false

func _input(event):
	# Handle jump.
	if event.is_action_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_multiplier
	# Handle drop through platform
	if event.is_action_pressed("move_down"):
		set_collision_mask_value(10, false)
	elif event.is_action_released("move_down"):
		set_collision_mask_value(10, true)
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed * speed_multiplier
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_multiplier)

	move_and_slide()

func to_spawn():
	transform.origin = GameManager.spawn_pos

func switch_controls():
	match active_controls:
		ControlScheme.JOYSTICK:
			button_controls.show()
			joystick_controls.hide()
			jump_button.scale = Vector2(3,3)
			jump_button.transform.origin = Vector2(144.0,368.0)
			joystick_controls.active = false
			active_controls = ControlScheme.BUTTON
			return
		ControlScheme.BUTTON:
			joystick_controls.show()
			button_controls.hide()
			jump_button.scale = Vector2(4,4)
			jump_button.transform.origin = Vector2(1024.0,448.0)
			joystick_controls.active = true
			active_controls = ControlScheme.JOYSTICK
			return
