extends CharacterBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(_delta):
	if !get_parent().paused:
		velocity.x = -100 
		set_velocity(velocity)
		move_and_slide()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
