extends Control
onready var door = get_parent().get_parent().get_parent().get_node("otrher/door")
onready var door_effect = get_parent().get_parent().get_parent().get_node("audio/door")

onready var check = get_node("Popup")
func _ready():
	pass

func _process(delta):
	check()

func _on_Button_pressed():
	
	if get_node("Popup").open() == true :
		door.queue_free()
		door_effect.play()
		get_node("Popup/WindowDialog").visible = false
	else : 
		get_node("Popup/WindowDialog/Panel2/Label").text = "Wrong Code !!"

func check() :
	if check.visible == true :
		return false
	else:
		return true