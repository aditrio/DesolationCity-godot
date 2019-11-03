extends Area2D

onready var check = get_parent().get_node("ammo/ui/finish/Popup")

func _ready():
	pass
	
func _process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies :
		if body.name == "player" and check.open() == true :
			get_tree().change_scene("res://scenes/survive.tscn")