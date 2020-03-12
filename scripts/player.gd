extends KinematicBody2D

var movement = Vector2.ZERO
var move_speed  = 300.0
var grafity = 25.0
var up_Dir = Vector2.UP
var animation = AnimatedSprite
export var jump_force = -500
var dash_speed = 1000.0
var can_dash = true
var can_jump = true
export var hp = 100.0
var ammo = 32
var ammo_mag = 4
var can_shoot = false
var upShoot = true
var bounce = -50
var stock_hp = 0
var can_heal = false
var move = true





var bullet = preload("res://scenes/bullet.tscn")
onready var cam = get_parent().get_node("Main Cam")
onready var heart_beat = get_parent().get_node("audio/heartbeat")
onready var popup = get_parent().get_node("ammo/ui/finish/Popup/WindowDialog")
onready var can_show = get_parent().get_node("ammo/ui/papers/Popup")

# Called when the node enters the scene tree for the first time.
func _ready():
	animation = get_node("Animation")
	set_process(true)
	$gun.visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var ammo_ui = get_parent().get_node("ammo/ui/base/ammo")
	var hp_ui = get_parent().get_node("ammo/ui/base2/hp")
	var ammo_mag_ui = get_parent().get_node("ammo/ui/base/ammo_mag")
	var all_ui = get_parent().get_node("ammo/ui/base")
	var health_bar = get_parent().get_node("ammo/ui/base3/TextureProgress")
	var ui_stock_hp = get_parent().get_node("ammo/ui/hp/RichTextLabel2")
	ui_stock_hp.text = str(stock_hp)

	hp_ui.text = str(hp)
	health_bar.value = hp
	if can_shoot == true:
		all_ui.visible = true
		ammo_ui.text = str(ammo)
		
		ammo_mag_ui.text = str("/" , ammo_mag)
	else:
		all_ui.visible = false


func _physics_process(delta : float) -> void:
	if move :
		playerMovement()
	
	playerShooting()
	died()
	reload()
	heal()
	


func playerMovement():
	
	movement.y += grafity 
	
	
	if(Input.is_action_pressed("right")):
		animateMovement(true , true)
		movement.x = move_speed 
		zoom_out_in(true)
	
	elif(Input.is_action_pressed("left")):
		animateMovement(true , false)
		movement.x = -move_speed
		zoom_out_in(true)
	elif Input.is_action_just_released("right") || Input.is_action_just_released("left"):
		movement.x = 0
		animateMovement(false , true)
		
	elif(Input.is_action_pressed("up")):
		$gun.rotation_degrees = -90
		$gun.position.x = 10
		$gun.position.y = -15
		if $Animation.flip_h :
			$gun.rotation_degrees = 90
			$gun.position.x = -10
			#$gun.position.y = -5
			
	
	elif Input.is_action_just_released("up"):
		$gun.rotation_degrees = 0
		$gun.position.y = 5
		if $Animation.flip_h:
			$gun.position.x = -20
		else:
			$gun.position.x = 30
	
	else :
		animateMovement(false , true)
		movement.x = 0
		
		zoom_out_in(false)
		
		
	if(is_on_floor()):

		
		if(Input.is_action_just_pressed("jump") && can_jump == true):
			
			var jump_s = get_parent().get_node("audio/jump")
			jump_s.play()
			movement.y = jump_force
			can_jump = false
			$Jump.start()
		
		if Input.is_action_just_pressed("dash") && can_dash == true:
			dash()
			can_dash = false
			$Delay.start()

	else:
		animation.play("jump")
	
	
	
	movement = move_and_slide(movement , up_Dir)
	
	
	
func animateMovement(var moving , var move_right):
	if(moving == true):
		animation.play("run")
		if(move_right == true):
			animation.flip_h = false
			$gun.flip_h = false
			$gun.position.x = 25
			$gun.position.y = 0
			$gun.rotation_degrees = 0
		else:
			animation.flip_h = true
			$gun.flip_h = true
			$gun.position.x = -25
			$gun.rotation_degrees = 0
			$gun.position.y = 0
			
			
	else:
		animation.play("idle")
	
func playerShooting():
	if can_shoot == true : 
		if Input.is_action_just_pressed("shoot") && ammo > 0:
			var sound_g = get_parent().get_node("audio/shoot")
			var b = bullet.instance()
			var far = Vector2()
			far.x = 50
			sound_g.playing = true
			var rotation = get_rotation()
			if movement.x != 0 :
				upShoot = false
			elif movement.x == 0 :
				upShoot = true
			if Input.is_action_pressed("up") && upShoot == true:
				rotation -= PI/2
				far.y = -50
				far.x = 10
				if $Animation.flip_h:
					far.x = -10
				
					
			elif $Animation.flip_h:
				rotation += PI
				far.x = -50
				
				
				
		
			var pos = get_position() + far
			get_parent().add_child(b)
			b.start_at(rotation, pos)
			ammo -= 1 

func reload():
	if ammo == 0 && ammo_mag > 0:
		var reloaded = get_parent().get_node("audio/reload")
		reloaded.playing = true
		ammo = 32
		print("reloaded")
		ammo_mag -= 1 
		

func dash():
	move_speed = dash_speed
	animation.play("dash")
	$Timer.start()

func _on_Timer_timeout():
	move_speed = 300.0

func _on_Delay_timeout():
	can_dash = true

func _on_Jump_timeout():
	can_jump = true

func died():
	var die = get_parent().get_node("player").position.y

	if hp > 100 :
		hp = 100
	if die >= 1000 :
		hp = 0
	if hp <= 0:
		get_tree().change_scene("res://scenes/failed.tscn")
	
func hit(damage):
	var shake_amount = 3
	cam.set_offset(Vector2(rand_range(-1.0,1.0) * shake_amount , rand_range(-1.0,1.0) * shake_amount))
	hp -= damage

func _on_weapon_area_entered(area):
 can_shoot = true
 $gun.visible = true
 get_parent().get_node("weapon").queue_free()





func _on_Area2D_body_entered(body):
	
	if body.is_in_group("enemies"):
		var collision_point = global_position - body.global_position
		var hit_sound = get_parent().get_node("audio/hit")
		hit_sound.play()
		movement.x = sign(collision_point.x) * (100 * 8) 
		
		hit(1.5)
		movement = move_and_slide(movement , up_Dir)
		
func zoom_out_in(move):
	if move == true :
		cam.zoom.x = 1.2
		cam.zoom.y = 1.2
	else:
		cam.zoom.x = 1.2
		cam.zoom.y = 1.2



func _on_radiation_area_entered(area):
	
	if area.name == "player" :
		var rad = get_parent().get_node("Main Cam/Sprite")
		rad.visible = true
		
		heart_beat.play()
		

func _on_radiation_area_exited(area):
	
	if area.name == "player" :
		var rad = get_parent().get_node("Main Cam/Sprite")
		rad.visible = false
		
		heart_beat.stop()
		
		
func add_hp(value) :
	stock_hp += value
	

func heal():
	if stock_hp != 0 :
		if Input.is_action_just_pressed("h"):
			if hp < 100 and hp > 0 :
				hp += 30
				stock_hp -= 1
			else:
				pass
				




func _on_player_area_entered(area):
	var paper = get_parent().get_node("ammo/ui/papers/Popup")
	var puzzle = get_parent().get_node("puzzle")
	if area.name == "one" :
		get_parent().get_node("ammo/ui/ui_call_paper").visible = true
		
		get_parent().get_node("ammo/ui/papers/panel1/Panel/Sprite").visible = true
		paper.one = true
		puzzle.get_node("one").queue_free()
		
	if area.name == "two" :
		get_parent().get_node("ammo/ui/papers/panel2/Panel/Sprite").visible = true
		paper.two = true
		puzzle.get_node("two").queue_free()
		
	if area.name == "three" :
		get_parent().get_node("ammo/ui/papers/panel3/Panel/Sprite").visible = true
		paper.three = true
		puzzle.get_node("three").queue_free()
		
	if area.name == "four" :
		get_parent().get_node("ammo/ui/papers/panel4/Panel/Sprite").visible = true
		paper.four = true
		puzzle.get_node("four").queue_free()
		
		



func _on_gate_body_entered(body):
	if body.name == "player" :
		popup.popup_centered()
		can_show.can_show = false
	else:
		pass


func _on_gate_body_exited(body):
	if body.name == "player" :
		popup.visible = false
		can_show.can_show = true
	else:
		pass

func _on_trigger_body_entered(body):
	move = false
	$Animation.play("idle")
	var trigger = get_parent().get_node("dialogBox/dialog")
	var mission =  get_parent().get_node("ammo/ui/quest")
	trigger.visible = true
	mission.visible = true
	
