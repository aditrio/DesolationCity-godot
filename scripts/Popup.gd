extends Popup 


onready var check = get_node("WindowDialog")
var one = false

func _ready():
	pass
func _process(delta):
	open()


func open():
	if check.get_node("one/Panel/LineEdit").text == "7293" :
		one = true
	
	
	if one :
		return true
	else :
		return false


func _on_Num_pressed():
	check.get_node("one/Panel/LineEdit").text += "1"


func _on_Num2_pressed():
	check.get_node("one/Panel/LineEdit").text += "2"
	

func _on_Num3_pressed():
	check.get_node("one/Panel/LineEdit").text += "3"


func _on_Num4_pressed():
	check.get_node("one/Panel/LineEdit").text += "4"


func _on_Num7_pressed():
	check.get_node("one/Panel/LineEdit").text += "7"

func _on_Num5_pressed():
	check.get_node("one/Panel/LineEdit").text += "5"

func _on_Num8_pressed():
	check.get_node("one/Panel/LineEdit").text += "8"

func _on_Num6_pressed():
	check.get_node("one/Panel/LineEdit").text += "6"

func _on_Num9_pressed():
	check.get_node("one/Panel/LineEdit").text += "9"

func _on_Num10_pressed():
	check.get_node("one/Panel/LineEdit").text += "0"
