extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AudioStreamPlayer2D.play()



func _on_Button_pressed():
	get_tree().change_scene("res://scenes/cutscene.tscn")
	

func _on_Button2_pressed():
	get_tree().quit()


func _on_Button3_pressed():
	get_tree().change_scene("res://scenes/about.tscn")
