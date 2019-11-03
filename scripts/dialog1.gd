extends RichTextLabel

var dialog = [".....","Get In The Bunker ??", "How Can I Get In ??.." , "'Collect All Papers !!' .. Ahh I See"]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)
	get_parent().get_parent().visible = false

func _input(event):
	if event.is_action_pressed("q"):
		get_parent().get_parent().visible = false
	if event.is_action_pressed("enter"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page+=1
				set_bbcode(dialog[page])
				set_visible_characters(0)
			elif page == dialog.size()-1:
				get_parent().get_parent().visible = false

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)



func _on_TouchScreenButton2_pressed():
	if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page+=1
				set_bbcode(dialog[page])
				set_visible_characters(0)
			elif page == dialog.size()-1:
				get_parent().get_parent().visible = false


func _on_TouchScreenButton_pressed():
	get_parent().get_parent().visible = false
