extends CharacterBody2D


@export var bvelocity = -200
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_process(delta):
	if !get_parent().paused:
		velocity.x = bvelocity
		set_velocity(velocity)
		move_and_slide()
