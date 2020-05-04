extends Area2D

# Declarations
signal enter_door

var is_closed = false

#export(String, FILE, "*.tscn") var target_level
export(int) var level_number
export(String) var door_name


# systemfunctions
func _physics_process(delta):
	for body in get_overlapping_bodies():
		if body.name == "Player" and Input.is_action_just_pressed("ui_up"):
			Globals.next_level_door = door_name
			Globals.next_level_number = level_number
			emit_signal("enter_door")


# own functions
func open_door():
	$AnimationPlayer.play("door_open")
	$CollisionShape2D.disabled = false
	is_closed = false
	
	
func close_door():
	$AnimationPlayer.play("door_close")
	$CollisionShape2D.disabled = true
	is_closed = true


# signal functions
func _on_Door_enter_door():
	get_node("../../../.").enter_door()
