extends Area2D

var cam_position

onready var cam = get_parent().get_node("Main Cam")
onready var door = get_parent().get_node("otrher/door")
onready var popup = get_parent().get_node("ammo/ui/finish/Popup/WindowDialog")
func _ready():
	cam_position = door.get_position()
	pass

func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies :
		if body.name == "player":
			cam.position = cam_position
		