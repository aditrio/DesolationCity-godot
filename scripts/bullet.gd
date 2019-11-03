extends Area2D

var vel = Vector2()
export var speed = 1000

func _ready():
    set_physics_process(true)

func _physics_process(delta : float) -> void:
	destroy()    

	set_position(get_position() + vel * delta)


	
func start_at(dir, pos):
    set_rotation(dir)
    set_position(pos)
    vel = Vector2(speed, 0).rotated(dir)

func destroy():
	var bodies = get_overlapping_bodies()
	
	
	for body in bodies:
		if body.name != null :
			queue_free()
		else:
			pass



func _on_Timer_timeout():
	queue_free()


func _on_Area2D_body_entered(body):
	var damage = 3
	if body.is_in_group("enemies"):
		body.hp(damage)
	
