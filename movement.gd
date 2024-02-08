extends CharacterBody2D

const Gravity = 10
const MAXSPEED = 600
var veloctity = Vector2.ZERO 
var lookDir = Vector2.ZERO #velocity of thingy
signal dead
var fortnite = 0
func get_input():
	if(Input.is_action_just_pressed("jump")):
		veloctity.y = - 300
		lookDir.y = + 300
func _physics_process(delta):
	veloctity.y += Gravity
	if veloctity.y > MAXSPEED:
		veloctity.y = MAXSPEED
	get_input()
	set_velocity(veloctity)
	move_and_slide()

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		emit_signal("dead")




