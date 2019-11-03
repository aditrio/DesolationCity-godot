extends Control

onready var pause = get_parent().get_node("pause")
func _ready():
	self.visible = true
	pass


func _on_Button_pressed():
	self.visible = false
	
	
