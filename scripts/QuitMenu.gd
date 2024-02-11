extends Button


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Button_pressed():
# warning-ignore:return_value_discarded
	GlobalVars.score = 0
	GlobalVars.diff = 5
	GlobalVars.pipeSpeed = -1
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
