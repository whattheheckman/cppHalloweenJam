extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	get_tree().paused = true
	$VBoxContainer/StartButton.grab_focus()

func _on_start_button_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://levels/suites_level.tscn")



func _on_options_button_pressed():
	pass
#	var options = load() #put options menu here
#	get_tree().current_scene.add_child(options) 


func _on_quit_button_pressed():
	get_tree().quit()
