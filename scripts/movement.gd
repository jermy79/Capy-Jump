extends CharacterBody2D

var Gravity = 10
const MAXSPEED = 600
var veloctity = Vector2.ZERO 
var lookDir = 0
var deadStop = false
signal dead
var fortnite = 0
func get_input():
	if(Input.is_action_just_pressed("jump")):
		veloctity.y = - 300
		lookDir = - 30
func _physics_process(delta):
	if !deadStop:
		if !get_parent().paused:
			veloctity.y += Gravity
			if veloctity.y > MAXSPEED:
				veloctity.y = MAXSPEED
			lookDir += 0.9
			if lookDir > 90:
				lookDir = 90
			set_rotation_degrees(lookDir)
			get_input()
			set_velocity(veloctity)
			move_and_slide()

		for i in get_slide_collision_count():
			var collision = get_slide_collision(i)
			emit_signal("dead")




