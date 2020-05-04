extends Area2D

# Declarations
onready var globals = get_node("/root/Globals")
onready var score = get_node("../../Score")


func _on_Coin_body_entered(body):
	globals.punkte += 10
	score.set_text("Punkte: "+str(globals.punkte))
	$GetCoin.play()
	get_node("../../.").collected_coins += 1
	queue_free()
