extends Area2D

# Declarations
var spikes_out = 1

onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.set_wait_time(2)
	timer.start()


func get_spikes_out():
	$AnimationPlayer.play("spikes_out")
	$CollisionShape2D.disabled = false
	spikes_out = 1


func get_spikes_in():
	$AnimationPlayer.play("spikes_in")
	$CollisionShape2D.disabled = true
	spikes_out = 0


func _on_Timer_timeout():
	if spikes_out:
		get_spikes_in()
		timer.set_wait_time(2)
		timer.start()
	else:
		get_spikes_out()
		timer.set_wait_time(2)
		timer.start()


func _on_Spikes_body_entered(body):
	if body.name == "Player":
		body.die()
