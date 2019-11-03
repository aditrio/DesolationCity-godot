extends Node2D

onready var hp =  

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _process(delta):
	$hp.value = hp.hp
