extends Node2D

var playerTarget : Node2D
var is_dead : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	playerTarget = get_parent().get_node("player")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(is_dead == true):
		pass
	position = playerTarget.get_position()
	
	


