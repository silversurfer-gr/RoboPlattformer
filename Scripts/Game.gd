extends Node2D

# Declarations
var level = null
var player = null

onready var fader = $Fader
onready var globals = get_node("/root/Globals")

# Called when the node enters the scene tree for the first time.
func _ready():
	add_level()
	fader.fade_in()

func add_level():
	var scene_path = "res://Scenes/Levels/Level"+str(globals.next_level_number)+".tscn"
	level = load(scene_path).instance()
	$Levels.add_child(level)
	
	player = level.find_node("Player")

func enter_door():
	#var animation_player = fader.fade_out()
	#yield(animation_player, "animation_finished")
	get_tree().paused = false
	get_tree().reload_current_scene()
	
func check_for_door():
	if Globals.next_level_door != null:
		var door = level.find_node(Globals.next_level_door)
		player.position = door.position
		Globals.next_level_door = null
