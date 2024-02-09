extends CharacterBody2D

signal score
var test = 0
var pipePos
@export var bvelocity = -200
var scorefr = 0
var pipeSpeed = -1
var pipeDis
var translate = Vector2(0,pipeSpeed)
var points = 4


func _ready():
	
	randomize()
	pipePos= randf_range(-110.000, 325.000)
	randomize()
	if randi_range(1,2) == 1:
		translate.y == 1
	$Pipes.move_local_y(pipePos)
	pass # Replace with function body.
	
func addScore(val): # function to add the score
	scorefr += val # add val to score
func _physics_process(_delta):
	if !get_parent().paused:
		velocity.x = bvelocity
		set_velocity(velocity)
		if points > 3:
			$Pipes.translate(translate)
			if $Pipes.position.y < -110:
					translate.y *= -1
			if $Pipes.position.y > 325:
				translate.y *= -1
		move_and_slide()
