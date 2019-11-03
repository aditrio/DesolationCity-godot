extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_parent().get_node("player")
var can_play = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$AudioStreamPlayer2D.playing = true
	

# Called every frame. 'delta' is the elapsed time since the previous frame.

