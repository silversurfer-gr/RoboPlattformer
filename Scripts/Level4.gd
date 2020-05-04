extends Node2D

# Declarations
var score = 0
var max_coins = 3
var collected_coins = 0

onready var help = find_node("Help")
onready var door = find_node("Door")
onready var globals = get_node("/root/Globals")
#onready var score = $Score

# Called when the node enters the scene tree for the first time.
func _ready():
	help.set_help("Level4 - \nClimp the ladder and find the key")
	
	door.close_door()
	score = globals.punkte
	$Score.set_text("Punkte: "+str(score))


# warning-ignore:unused_argument
func _process(delta):
	if collected_coins == max_coins and door.is_closed:
		door.open_door()
