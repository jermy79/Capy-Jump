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
	lookDir.x = - 10
	veloctity.y += Gravity
	lookDir.y +=2
	if veloctity.y > MAXSPEED:
		veloctity.y = MAXSPEED
	if lookDir.y > 100:
		lookDir.y = 100
	look_at(lookDir)
	get_input()
	set_velocity(veloctity)
	move_and_slide()

	for i in get_slide_collision_count():
		var collision = get_slide_collision(i)
		emit_signal("dead")




