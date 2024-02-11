extends CharacterBody2D
var pipePos
@export var bvelocity = -200
var pipeDis = Vector2(0,0)
var translate = Vector2(0,GlobalVars.pipeSpeed)
var maxHeight = -85

func _ready():
	
	randomize()
	maxHeight -= GlobalVars.diff
	pipePos= randf_range(maxHeight, 160.000)
	randomize()
	if randi_range(1,2) == 1:
		translate.y == 1
	var pipeSpawnPos = Vector2(0,pipePos)
	$Pipes.translate(pipeSpawnPos)
	if GlobalVars.score%5==0:
		GlobalVars.pipeSpeed -=0.5
	if GlobalVars.score%10==0:
		GlobalVars.diff +=3
	pipeDis.y = GlobalVars.diff
	$Pipes/pipe.translate(pipeDis)
	pass # Replace with function body.

func _physics_process(_delta):
	if !get_parent().paused:
		velocity.x = bvelocity
		set_velocity(velocity)
		if GlobalVars.score >= 10:
			$Pipes.translate(translate)
			if $Pipes.position.y < maxHeight:
					translate.y *= -1
			if $Pipes.position.y > 270:
				translate.y *= -1
		move_and_slide()
