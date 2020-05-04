extends Area2D

# Declarations


func _on_Ladder_body_entered(body):
	if "Player" in body.name:
		body.set_climping(true)
	
	


func _on_Ladder_body_exited(body):
	if "Player" in body.name:
		body.set_climping(false)
