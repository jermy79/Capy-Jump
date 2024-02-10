extends Node2D
@onready var wee = get_node("score2")
var dead = 0
var paused = false
var songPos
func spawn():
	var scene = load("res://scenes/block.tscn")
	var scene2 = load("res://scenes/score.tscn")
	var block1 = scene.instantiate()
	var block2 = scene2.instantiate()
	add_child(block1)
	add_child(block2)
func spawnb():
	var scene = load("res://scenes/background.tscn")
	var back = scene.instantiate()
	add_child(back)
func get_input():
	if(Input.is_action_pressed("mike")):
		$Node2D3/Sprite2D.show()
	if(Input.is_action_pressed("pause")):
		$"Pause Menu".show()
		songPos = $AudioStreamPlayer2D.get_playback_position()
		$AudioStreamPlayer2D.stop()
		$Timer.paused = true
		$Timer2.paused = true
		paused = true
func _ready():
	$Timer.start()
	$Timer2.start() # If autostart isn't selected, will start the timer
	spawn()  
	spawnb()  # Do this or else it will take 10 secs                    
								# before enemies spawn
func _on_Timer_timeout():
	spawn()
	$Timer.start()    
func _on_Timer2_timeout():
	spawnb()
	$Timer2.start()    
func _on_Area2D_body_entered(body):
	body.queue_free()
func _on_capy_dead():
	$capy.set_rotation_degrees(0)
	$"Death Menu".show()
	$capy/Sprite2D.set_offset(Vector2(100000,100000))
	$capy.deadStop = true
	$capy/Node2D.play("default")
	paused = true
	dead = 1

func _physics_process(_delta):
	if !paused:
		get_input()
		if (dead == 0):
			$score/Label2.set_text(str(GlobalVars.score))
			if $points2.is_colliding() == true:
				var hit = $points2.get_collider()
				if (hit):
						hit.queue_free()
						GlobalVars.score += 1
						$score/AudioStreamPlayer2D.play()
func _on_Node2D_animation_finished():
	$capy.queue_free()


func _on_paused():
	$AudioStreamPlayer2D.play(songPos)
	paused = false
	$"Pause Menu".hide()
	$Timer.paused = false
	$Timer2.paused = false
	


