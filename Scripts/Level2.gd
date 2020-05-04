extends Node2D

# Declarations
var score = 0

onready var help = find_node("Help")
onready var door = find_node("Door")
onready var globals = get_node("/root/Globals")
#onready var score = $Score

# Called when the node enters the scene tree for the first time.
func _ready():
	#help.set_help("Level1 \nEnter the Gate")
	help.set_help("Level2 \nWatch the spikes")
	#help.set_help("Level3 - \nCollect the all coins")
	
	door.open_door()
	score = globals.punkte
	$Score.set_text("Punkte: "+str(score))


# warning-ignore:unused_argument
func _process(delta):
	if Input.is_action_just_pressed("ui_d"):
		$Player.die()

