extends Area2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var fox = get_parent().get_parent().get_node("enemies/fox3")
# Called when the node enters the scene tree for the first time.
func _ready():
	position = fox.position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
