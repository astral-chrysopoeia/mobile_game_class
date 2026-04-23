extends Node2D

var area_path = "res://Assets/Scenes/Areas/"
var spawn_pos: Vector2 = Vector2.ZERO
@onready var player: PlayerController = $Player
@onready var area_container: Node2D = $Area
var is_paused : bool = false
var current_level : String

var start_level

func _ready():
	start_level = Globals.start_level
	to_area(start_level)
	current_level = start_level

func to_area(destination: String):
	var full_path = area_path + destination + ".tscn"
	var scene = load(full_path) as PackedScene
	if !scene:
		return
	#remove the previous scene
	for child in area_container.get_children():
		child.queue_free()
		await child.tree_exited
	#set up new scene
	var instance = scene.instantiate()
	area_container.add_child(instance)
	instance.gameplay_manager = self
	player.to_spawn()
	current_level = destination
