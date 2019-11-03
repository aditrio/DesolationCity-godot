extends Popup 


onready var check = get_node("WindowDialog")
var one = false
var two = false
var three = false
var four = false
func _ready():
	pass
func _process(delta):
	open()


func open():
	if check.get_node("one/Panel/LineEdit").text == "7" :
		one = true
	if check.get_node("two/Panel/LineEdit").text == "2" :
		two = true
	if check.get_node("three/Panel/LineEdit").text == "9" :
		three = true
	if check.get_node("four/Panel/LineEdit").text == "3" :
		four = true
	
	if one and two and three and four :
		return true
	else :
		return false
