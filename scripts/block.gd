extends CharacterBody2D
var pipePos
@export var bvelocity = -200
var pipeSpeed = -1
var pipeDis
var translate = Vector2(0,pipeSpeed)



func _ready():
	
	randomize()
	pipePos= randf_range(-70.000, 285.000)
	randomize()
	if randi_range(1,2) == 1:
		translate.y == 1
	$Pipes.move_local_y(pipePos)
	pass # Replace with function body.

func _physics_process(_delta):
	if !get_parent().paused:
		velocity.x = bvelocity
		set_velocity(velocity)
		if GlobalVars.score > 2:
			$Pipes.translate(translate)
			if $Pipes.position.y < -70:
					translate.y *= -1
			if $Pipes.position.y > 285:
				translate.y *= -1
		move_and_slide()
