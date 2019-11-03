extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var body = get_overlapping_bodies()
	for bd in body :
		if bd.name == "besi" :
			player.movement.x += 10
		else :
			pass
		
