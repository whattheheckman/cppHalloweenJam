extends Control

# var info := "You found your way way with %.f /% of your battery remaining."

@onready var output: Label = $Label

func _process(_delta: float) -> void:
	pass
	# output.text = info % [$]



func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://levels/suites_level.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
