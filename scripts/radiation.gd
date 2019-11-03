extends Area2D

var damage = 0.04


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass
	

func _physics_process(delta):
	hit()

func hit():
	var player = get_parent().get_node("player")
	var bodies = get_overlapping_bodies()
	
	
	for body in bodies:
		if body.name == "player":
			player.hit(damage)
		elif body.name != "player" :
			pass
		
			





