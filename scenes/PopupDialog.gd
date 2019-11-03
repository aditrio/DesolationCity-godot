extends Popup

var one = false
var two = false
var three = false
var four = false

# warning-ignore:unused_class_variable
var can_show = true

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# warning-ignore:unused_argument
func _physics_process(delta):
	if can_show:
		if one :
			if Input.is_action_just_pressed("1"):
				$one.popup_centered()
				var hint = get_parent().get_parent().get_node("ui_call_paper")
				hint.visible = false
			if Input.is_action_just_released("1"):
				$one.visible = false
		
		if two :
			if Input.is_action_just_pressed("2"):
				$two.popup_centered()
			if Input.is_action_just_released("2"):
				$two.visible = false
				
		if three :
			if Input.is_action_just_pressed("3"):
				$three.popup_centered()
			if Input.is_action_just_released("3"):
				$three.visible = false
		
		if four :
			if Input.is_action_just_pressed("4"):
				$four.popup_centered()
			if Input.is_action_just_released("4"):
				$four.visible = false