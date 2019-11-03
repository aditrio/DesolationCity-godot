extends Control

func _ready():
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		var pause = not get_tree().paused
		get_tree().paused = pause
		visible = pause
	

func _on_Button_pressed():
	var pause = not get_tree().paused
	get_tree().paused = pause
	visible = pause


func _on_Button3_pressed():
	var pause = not get_tree().paused
	get_tree().paused = pause
	visible = pause
	get_tree().change_scene("res://scenes/menu.tscn")


func _on_Button2_pressed():
	var how = get_parent().get_node("how_to_play")
	var pause = not get_tree().paused
	get_tree().paused = pause
	visible = pause
	how.visible = true
	


func _on_Button4_pressed():
	var pause = not get_tree().paused
	get_tree().paused = pause
	visible = pause
	get_tree().reload_current_scene()
