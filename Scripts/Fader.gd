# Fader.gd
extends ColorRect

func fade_in():
	$AnimationPlayer.play("fade_in")
	return $AnimationPlayer
	
func fade_out():
	get_tree().paused = true
	$AnimationPlayer.play("fade_out")
	return $AnimationPlayer
