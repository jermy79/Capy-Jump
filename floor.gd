extends CharacterBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func _physics_process(delta):
	velocity.x = -200 
	set_velocity(velocity)
	move_and_slide()
	



