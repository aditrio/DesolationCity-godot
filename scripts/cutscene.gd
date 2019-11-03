extends RichTextLabel

var dialog = ["Ahh.. My Head..","Why I'am Here...","I Have No Idea About Them ...","Hopefully, They Are Still Alive...","Oh No ... This Place is So Dangerous....", "I have to get out ASAP !!!.."]
var page = 0

func _ready():
	set_bbcode(dialog[page])
	set_visible_characters(0)
	set_process_input(true)

func _input(event):
	if event.is_action_pressed("q"):
		get_tree().change_scene("res://scenes/Gameplay.tscn")
	if event.is_action_pressed("enter"):
		if get_visible_characters() > get_total_character_count():
			if page < dialog.size()-1:
				page+=1
				set_bbcode(dialog[page])
				set_visible_characters(0)
			elif page == dialog.size()-1:
				get_tree().change_scene("res://scenes/Gameplay.tscn")

func _on_Timer_timeout():
	set_visible_characters(get_visible_characters()+1)
