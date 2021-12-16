extends Node2D


func _input(event):
	if event is InputEventKey and event.pressed:
		if event.scancode == KEY_R: 
			get_tree().change_scene("res://Main.tscn")
