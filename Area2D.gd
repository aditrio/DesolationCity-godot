extends Area2D

func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "player" :
			$AnimatedSprite.playing = true
			$AnimatedSprite.frame = 0
