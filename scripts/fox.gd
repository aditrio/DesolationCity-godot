extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var movespeeed = 300.0
var vel = Vector2.ZERO
var up_dir = Vector2.UP
onready var player = get_parent().get_parent().get_node("player")
var react_time = 200.0
var dir = 0
var next_dir 
var next_dir_time = 0
var hp = 10
var gravity = 20.0
# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("enemies")
	

func _physics_process(delta):
	movement()
	died()

func movement():
	
	var far = position.x - player.position.x
	
	if (far >= -300 and far < 0) and next_dir != 1:
		next_dir = 1
		next_dir_time = OS.get_ticks_msec() + react_time
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = false
	elif (far <= 300 and far > 0) and next_dir != -1:
		next_dir = -1
		next_dir_time = OS.get_ticks_msec() + react_time
		$AnimatedSprite.play("run")
		$AnimatedSprite.flip_h = true
	elif (far > 300 or far < -300) and next_dir != 0 :
		next_dir= 0
		next_dir_time = OS.get_ticks_msec() + react_time
		idle()
	if OS.get_ticks_msec() > next_dir_time: 
		dir = next_dir
	vel.y += gravity
	vel.x = movespeeed * dir
	vel = move_and_slide(vel , up_dir)

func idle():
	$AnimatedSprite.play("idle")

func hp(damage):
	hp -= damage
func died():
	if self.position.y >= 1000:
		hp = 0
		
	if hp <= 0:
		print("die")
		queue_free()