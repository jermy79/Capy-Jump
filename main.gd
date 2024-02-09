extends Node2D
var score = 0
@onready var wee = get_node("score2")
var wow = 0
var dead = 0
var paused = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#Load the resourse using preload


func spawn():
	var scene = load("res://block.tscn")
	var scene2 = load("res://score.tscn")
	var block1 = scene.instantiate()
	var block2 = scene2.instantiate()
	add_child(block1)
	add_child(block2)
func spawnb():
	var scene = load("res://background.tscn")
	var back = scene.instantiate()
	add_child(back)
func get_input():
	if(Input.is_action_pressed("mike")):
		$Node2D3/Sprite2D.show()
	if(Input.is_action_pressed("pause")):
		$Node2D2.show()
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
	$Control.show()
	$capy/Sprite2D.set_offset(Vector2(100000,100000))
	$capy.remove_child($capy/CollisionShape2D)
	$capy.deadStop = true
	$capy/Node2D.play("default")
	paused = true
	dead = 1
func score1(val):
	wow += val
func _physics_process(delta):
	if !paused:
		get_input()
		if (dead == 0):
			score = $level_block.scorefr
			$score/Label2.set_text(str(wow))
			if $points2.is_colliding() == true:
				var hit = $points2.get_collider()
				if (hit):
						hit.queue_free()
						score1(1)
func _on_Node2D_animation_finished():
	$capy.queue_free()


func _on_paused():
	paused = false
	$Node2D2.hide()
	$Timer.paused = false
	$Timer2.paused = false
	
