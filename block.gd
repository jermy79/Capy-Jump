extends CharacterBody2D

signal score
var test = 0

var poopy = Vector2(1,1)
@export var bvelocity = -200
var scorefr = 0

func _ready():
	
	randomize()
	poopy.y = randf_range(0.000, 0.700)
	var poopy2 = Vector2(1, (1-poopy.y - 0.300))
	$pipe.apply_scale(poopy)
	$pipe2.apply_scale(poopy2)
	pass # Replace with function body.
	
func addScore(val): # function to add the score
	scorefr += val # add val to score
func _physics_process(delta):
	velocity.x = bvelocity
	set_velocity(velocity)
	move_and_slide()
