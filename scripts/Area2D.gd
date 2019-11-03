extends Area2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var bodies = get_overlapping_bodies()

	for body in bodies:
		if body.name == "player":
			get_tree().change_scene("scenes/level2.tscn")

