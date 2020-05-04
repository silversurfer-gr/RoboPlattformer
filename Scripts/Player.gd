extends KinematicBody2D

# Declarctions
const SPEED = 200
const FLOOR = Vector2(0, -1)
const GRAVITY = 10
const JUMP_POWER = 300

var velocity = Vector2()
var direction = 1 # 1 = nach rechts, 0 = nach links 
var is_climping = false 

onready var sprite = $AnimationPlayer

# Functions

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.play("spawn")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity.x = 0
	velocity.y += GRAVITY * int(!is_climping)
	
	check_key_input()
	print(velocity)
	velocity = move_and_slide(velocity, FLOOR)
	
	set_animation()


func check_key_input():
	if Input.is_action_pressed("ui_left"):
		velocity.x = - SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x = SPEED
	if Input.is_action_just_pressed("ui_up"):
		if is_climping:
			velocity.y = -SPEED
		else:
			if is_on_floor():
				velocity.y = -JUMP_POWER


func set_animation():
	if velocity.x > 0:
		#nach rechts
		sprite.play("walk_right")
		direction = 1
		
	if velocity.x < 0:
		#nach Links
		sprite.play("walk_left")
		direction = 0
	
	if velocity.x == 0:
		if direction:
			sprite.play("idle_right")
		else:
			sprite.play("idle_left")
		
	if !is_on_floor():
		if direction:
			sprite.play("air_right")
		else:
			sprite.play("air_left")


func die():
	print("die")
	$AnimationPlayer.play("dead")
	$Timer.start()
	#get_tree().change_scene("res://Scenes/Levels/Level2.tscn")


func set_climping(status):
	is_climping = status


func _on_AnimationPlayer_animation_finished(anim_name):
	print($AnimationPlayer.current_animation)
	if $AnimationPlayer.current_animation == "die":
		get_tree().change_scene("res://Scenes/Levels/Level2.tscn")


func _on_Timer_timeout():
	get_tree().change_scene("res://Scenes/Levels/Level2.tscn")
